#include "sensoray826.h"

void sensoray826_dev::open()
{
    boardflags = S826_SystemOpen();
    if (boardflags < 0)
        errcode = boardflags; // problem during open
    else if ((boardflags & (1 << board)) == 0) {
        int i;
        printf("TARGET BOARD of index %d NOT FOUND\n",board);         // driver didn't find board you want to use
        for (i = 0; i < 8; i++) {
            if (boardflags & (1 << i)) {
                printf("board %d detected. try [ %d ] board \n", i, i);
            }
        }
    }
    else
    {
        for (int i = 0; i < 8; i++) {
            if (boardflags & (1 << i)) {
                printf("board %d detected." , i);
             }
        }
        isOpen = true;
    }

    switch (errcode)
    {
    case S826_ERR_OK:           break;
    case S826_ERR_BOARD:        printf("Illegal board number"); break;
    case S826_ERR_VALUE:        printf("Illegal argument"); break;
    case S826_ERR_NOTREADY:     printf("Device not ready or timeout"); break;
    case S826_ERR_CANCELLED:    printf("Wait cancelled"); break;
    case S826_ERR_DRIVER:       printf("Driver call failed"); break;
    case S826_ERR_MISSEDTRIG:   printf("Missed adc trigger"); break;
    case S826_ERR_DUPADDR:      printf("Two boards have same number"); break;S826_SafeWrenWrite(board, 0x02);
    case S826_ERR_BOARDCLOSED:  printf("Board not open"); break;
    case S826_ERR_CREATEMUTEX:  printf("Can't create mutex"); break;
    case S826_ERR_MEMORYMAP:    printf("Can't map board"); break;
    default:                    printf("Unknown error"); break;
    }

}

void sensoray826_dev::analogSampleStart(const SLOTATTR *slotattrs, int count)
{
    for(int i=0; i<count; i++)
    {
        PRINT_ERR(S826_AdcSlotConfigWrite(board, i, slotattrs[i].chan, slotattrs[i].tsettle, S826_ADC_GAIN_1) );
    }
    PRINT_ERR( S826_AdcSlotlistWrite(board, 0xFFFF, S826_BITWRITE)   );  // enable all timeslots
    PRINT_ERR( S826_AdcTrigModeWrite(board, 0)                       );  // select continuous (untriggered) mode
    PRINT_ERR( S826_AdcEnableWrite(board, 1)                         );  // enable conversions

    isADCThreadOn = true;
    adcThread = boost::thread( boost::bind(&sensoray826_dev::analogSampleLoopThread, this) );
    //adcThread.start_thread();
}

void sensoray826_dev::analogSingleSamplePrepare(const SLOTATTR *slotattrs , int count)
{

    for(int i=0; i<count; i++)
    {
        PRINT_ERR(S826_AdcSlotConfigWrite(board, i, slotattrs[i].chan, slotattrs[i].tsettle, S826_ADC_GAIN_1) );
    }
    PRINT_ERR( S826_AdcSlotlistWrite(board, 0xFFFF, S826_BITWRITE)   );  // enable all timeslots
    PRINT_ERR( S826_AdcTrigModeWrite(board, 0)                       );  // select continuous (untriggered) mode
    PRINT_ERR( S826_AdcEnableWrite(board, 1)                         );  // enable conversions*/
}

void sensoray826_dev::analogSampleStop()
{
    if(isADCThreadOn)
    {
        isADCThreadOn = false;
        adcThread.join();
    }
    PRINT_ERR( S826_AdcEnableWrite(board, 0)                         );  // halt adc conversions
}

void sensoray826_dev::analogOversample()
{
    uint slotList = 0xFFFF;
    //PRINT_ERR ( S826_AdcRead(board, _adBuf, _timeStamp,&slotList, 0));
    S826_AdcRead(board, _adBuf, _timeStamp,&slotList, 0);
    for(int i=0; i<ADC_MAX_SLOT; i++)
    {
        if ((((slotList >> (int)i) & 1) != 0)) {
            // extract adcdata, burstnum, and bufoverflowflag from buf
            adcDatas[i] = (int16_t)((_adBuf[i] & 0xFFFF));
            burstNum[i] = ((uint32_t)_adBuf[i] >> 24);
            adcVoltages[i] = adcDatas[i] * 10.0 / 32768;
        }
    }
   // printf("%.3lf %.3lf %.3lf %.3lf %.3lf %.3lf ", adcVoltages[0], adcVoltages[1], adcVoltages[2], adcVoltages[3], adcVoltages[4], adcVoltages[5]);
}
void sensoray826_dev::analogSampleLoopThread()
{
    while(isADCThreadOn)
    {
        uint slotList = 0xFFFF;
        //PRINT_ERR ( S826_AdcRead(board, _adBuf, _timeStamp, &slotList, 0));
        S826_AdcRead(board, _adBuf, _timeStamp, &slotList, 0);
        for(int i=0; i<ADC_MAX_SLOT; i++)
        {
            if ((((slotList >> (int)i) & 1) != 0)) {
                // extract adcdata, burstnum, and bufoverflowflag from buf
                adcDatas[i] = (int16_t)((_adBuf[i] & 0xFFFF));
                burstNum[i] = ((uint32_t)_adBuf[i] >> 24);
                adcVoltages[i] = adcDatas[i] * 10.0 / 32768;
            }
        }

    //    printf("%.3lf %.3lf %.3lf %.3lf %.3lf %.3lf ", adcVoltages[0], adcVoltages[1], adcVoltages[2], adcVoltages[3], adcVoltages[4], adcVoltages[5]);
        //printf("%.4lf %.4lf %.4lf %.4lf %.4lf %.4lf ", axisData[0], axisData[1], axisData[2], axisData[3], axisData[4], axisData[5]);

        //printf("%8x",buf[0]);
        //printf("d= %d, B=%d",adcDatas[8],burstNum[8]);
        //boost::this_thread::sleep(boost::posix_time::milliseconds(1));
    }
}
void sensoray826_dev::encoderInitialize(int board)
{
  for(int i=0; i<6; i++)
  {
    S826_CounterModeWrite(board, i, S826_CM_K_QUADX4);
    S826_CounterStateWrite(board, i, 1);
  }
}
void sensoray826_dev::encoderRawData(int board, int counter, uint &counts)
{
  S826_CounterRead(board, counter, &counts);

}
void sensoray826_dev::multipleEncoder(std::vector<double> &leg_q, const double cnt_rad)
{
  uint l_leg, r_leg;
  double l_leg1, r_leg1;
  leg_q.resize(12);
  for (int i=0; i<6; i++)
  {
    encoderRawData(0, i, l_leg);
    l_leg1 = cnt_rad * l_leg;
    if(l_leg1 >= 27451.738660278/2) //Prevent range of uint Overflow
    {
      l_leg1 = l_leg1-27451.655486088;
    }
    leg_q[i] = l_leg1;
  }
  for (int i=0; i<6; i++)
  {
    encoderRawData(1, i, r_leg);
    r_leg1 = cnt_rad * r_leg;
    if(r_leg1 >= 27451.655486088/2) //Prevent range of uint Overflow
    {
      r_leg1 = r_leg1-27451.655486088;
    }
    leg_q[i+6] = r_leg1;
  }
}
