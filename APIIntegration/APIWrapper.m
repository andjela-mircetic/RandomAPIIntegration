//
//  APIWrapper.m
//  APIIntegration
//
//  Created by Andjela Mircetic on 3.8.24..
//

#import <Foundation/Foundation.h>
#import "APIWrapper.h"
#import <APIIntegration/APIIntegration-Swift.h>

static RandomOrgAPI *apiInstance;

void initializeAPI() {
    apiInstance = [[RandomOrgAPI alloc] init];
}

void generateIntegers(int n, int min, int max, void (^completion)(NSArray *result)) {
    [apiInstance generateIntegersWithN:n min:min max:max completion:^(NSArray * _Nullable result) {
        completion(result);
    }];
}

void generateIntegerSequences(int n, int length, int min, int max, void (^completion)(NSArray *result)) {
    [apiInstance generateIntegerSequencesWithN:n length:length min:min max:max completion:^(NSArray * _Nullable result) {
        completion(result);
    }];
}

void generateDecimalFractions(int n, int decimalPlaces, void (^completion)(NSArray *result)) {
    [apiInstance generateDecimalFractionsWithN:n decimalPlaces:decimalPlaces completion:^(NSArray * _Nullable result) {
        completion(result);
    }];
}

void generateGaussians(int n, double mean, double standardDeviation, int significantDigits, void (^completion)(NSArray *result)) {
    [apiInstance generateGaussiansWithN:n mean:mean standardDeviation:standardDeviation significantDigits:significantDigits completion:^(NSArray * _Nullable result) {
        completion(result);
    }];
}

void generateStrings(int n, int length, NSString *characters, void (^completion)(NSArray *result)) {
    [apiInstance generateStringsWithN:n length:length characters:characters completion:^(NSArray * _Nullable result) {
        completion(result);
    }];
}

void generateUUIDs(int n, void (^completion)(NSArray *result)) {
    [apiInstance generateUUIDsWithN:n completion:^(NSArray * _Nullable result) {
        completion(result);
    }];
}

void generateBlobs(int n, int size, NSString *format, void (^completion)(NSArray *result)) {
    [apiInstance generateBlobsWithN:n size:size format:format completion:^(NSArray * _Nullable result) {
        completion(result);
    }];
}

void verifySignature(NSString *randomData, NSString *signature, void (^completion)(BOOL result)) {
    [apiInstance verifySignatureWithRandomData:randomData signature:signature completion:^(BOOL result) {
        completion(result);
    }];
}

void getUsage(void (^completion)(NSString *result)) {
    [apiInstance getUsageWithCompletion:^(NSString * _Nullable result) {
        completion(result);
    }];
}
