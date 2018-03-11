//+-------------------------------------------------------------------+
//|                                              11_ReadSentiment.mqh |
//|                                  Copyright 2018, Vladimir Zhbanko |
//+-------------------------------------------------------------------+
#property copyright "Copyright 2018, Vladimir Zhbanko"
#property link      "https://vladdsm.github.io/myblog_attempt/"
#property strict
// function returning an integer value with suggested trade direction
// version 01
// date 11.03.2018

//+-------------------------------------------------------------+//
// Aim of this function is to return information trading direction
// suggested by text sentiment analysis
// see experiment in: https://www.udemy.com/forex-news-and-sentiment-analysis/?couponCode=LAZYTRADE1-10
//+-------------------------------------------------------------+//
/*
Function Functional Description:
Function is returning -1 if no trades needs to be done or in case of errors
Function will return 0 in case BUY trade is suggested
Function will return 1 in case SELL trade is suggested

User guide:
1. #include this file to the folder Include #include <11_ReadSentiment.mqh>
2. Define int variable Direction
3. use code to read Direction = ReadSentiment("USDCAD", -1);
*/

//+------------------------------------------------------------------+
// FUNCTION ReadSentiment
//+------------------------------------------------------------------+
// This function is needed to reduce computation of intrabars

/* 
return TRUE if new bar is opened first time
return FALSE in case intrabar

Inputs: Trading Pair = "GBPUSD";
        DefaultDirection = -1;

*/

//+------------------------------------------------------------------+
//| FUNCTION READ FILE
//+------------------------------------------------------------------+
//function
int ReadSentiment(string Pair, int DefaultDirection) 
{
int handle, el1 = DefaultDirection;
string str;

handle=FileOpen("Sentiment_"+string(Pair)+ ".csv",FILE_READ);
if(handle==-1)Print("Function Read Prediction: Error - file does not exist" + string(Pair)); 
if(FileSize(handle)==0){FileClose(handle); Comment("Error - File is empty"); }
   
   while(!FileIsEnding(handle))
   {
   str=FileReadString(handle);
   el1 = (int)str;
   
   }
   
   FileClose(handle);
   return(el1);
}
//+------------------------------------------------------------------+
//| END OF FUNCTION READ FILE
//+------------------------------------------------------------------+

