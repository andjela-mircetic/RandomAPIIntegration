//
//  APIWrapper.h
//  APIIntegration
//
//  Created by Andjela Mircetic on 3.8.24..
//

#ifndef APIWrapper_h
#define APIWrapper_h

#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

void initializeAPI();
void generateIntegers(int n, int min, int max, void (^completion)(NSArray *result));
void generateIntegerSequences(int n, int length, int min, int max, void (^completion)(NSArray *result));
void generateDecimalFractions(int n, int decimalPlaces, void (^completion)(NSArray *result));
void generateGaussians(int n, double mean, double standardDeviation, int significantDigits, void (^completion)(NSArray *result));
void generateStrings(int n, int length, NSString *characters, void (^completion)(NSArray *result));
void generateUUIDs(int n, void (^completion)(NSArray *result));
void generateBlobs(int n, int size, NSString *format, void (^completion)(NSArray *result));
void verifySignature(NSString *randomData, NSString *signature, void (^completion)(BOOL result));
void getUsage(void (^completion)(NSString *result));

#ifdef __cplusplus
}
#endif


#endif /* APIWrapper_h */
