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

void generateIntegers(int n, int min, int max, void (*completion)(const char*)) {
    NSLog(@"generateIntegers called with n: %d, min: %d, max: %d", n, min, max);
    [apiInstance generateIntegersWithN:n min:min max:max completion:^(NSArray<NSNumber *> * _Nullable result) {
        if (result) {
            NSMutableString *resultString = [NSMutableString string];
            for (NSNumber *number in result) {
                [resultString appendFormat:@"%@,", number];
            }
            if ([resultString length] > 0) {
                [resultString deleteCharactersInRange:NSMakeRange([resultString length] - 1, 1)];
            }
            const char* resultCStr = [resultString UTF8String];
            NSLog(@"generateIntegers result: %s", resultCStr);
            completion(resultCStr);
        } else {
            NSLog(@"generateIntegers result is nil");
            completion("");
        }
    }];
}

void generateIntegerSequences(int n, int length, int min, int max, void (*completion)(const char*)) {
    NSLog(@"generateIntegerSequences called with n: %d, length: %d, min: %d, max: %d", n, length, min, max);
    [apiInstance generateIntegerSequencesWithN:n length:length min:min max:max completion:^(NSArray<NSArray<NSNumber *> *> * _Nullable result) {
        if (result) {
            NSMutableString *resultString = [NSMutableString string];
            for (NSArray<NSNumber *> *sequence in result) {
                NSMutableString *sequenceString = [NSMutableString string];
                for (NSNumber *number in sequence) {
                    [sequenceString appendFormat:@"%@,", number];
                }
                if ([sequenceString length] > 0) {
                    [sequenceString deleteCharactersInRange:NSMakeRange([sequenceString length] - 1, 1)];
                }
                [resultString appendFormat:@"[%@];", sequenceString];
            }
            if ([resultString length] > 0) {
                [resultString deleteCharactersInRange:NSMakeRange([resultString length] - 1, 1)];
            }
            const char* resultCStr = [resultString UTF8String];
            NSLog(@"generateIntegerSequences result: %s", resultCStr);
            completion(resultCStr);
        } else {
            NSLog(@"generateIntegerSequences result is nil");
            completion("");
        }
    }];
}


void generateDecimalFractions(int n, int decimalPlaces, void (*completion)(const char*)) {
    [apiInstance generateDecimalFractionsWithN:n decimalPlaces:decimalPlaces completion:^(NSArray<NSNumber *> * _Nullable result) {
        if (result) {
            NSMutableString *resultString = [NSMutableString string];
            for (NSNumber *number in result) {
                [resultString appendFormat:@"%@,", number];
            }
            if ([resultString length] > 0) {
                [resultString deleteCharactersInRange:NSMakeRange([resultString length] - 1, 1)];
            }
            const char* resultCStr = [resultString UTF8String];
            NSLog(@"generateDecimalFractions result: %s", resultCStr);
            completion(resultCStr);
        } else {
            NSLog(@"generateDecimalFractions result is nil");
            completion("");
        }
    }];
}


void generateGaussians(int n, double mean, double standardDeviation, int significantDigits, void (*completion)(const char*)) {
    [apiInstance generateGaussiansWithN:n mean:mean standardDeviation:standardDeviation significantDigits:significantDigits completion:^(NSArray<NSNumber *> * _Nullable result) {
        if (result) {
            NSMutableString *resultString = [NSMutableString string];
            for (NSNumber *number in result) {
                [resultString appendFormat:@"%@,", number];
            }
            if ([resultString length] > 0) {
                [resultString deleteCharactersInRange:NSMakeRange([resultString length] - 1, 1)];
            }
            const char* resultCStr = [resultString UTF8String];
            NSLog(@"generateGaussians result: %s", resultCStr);
            completion(resultCStr);
        } else {
            NSLog(@"generateGaussians result is nil");
            completion("");
        }
    }];
}

void generateStrings(int n, int length, NSString *characters, void (*completion)(const char*)) {
    [apiInstance generateStringsWithN:n length:length characters:characters completion:^(NSArray<NSString *> * _Nullable result) {
        if (result) {
            NSMutableString *resultString = [NSMutableString string];
            for (NSString *string in result) {
                [resultString appendFormat:@"%@,", string];
            }
            if ([resultString length] > 0) {
                [resultString deleteCharactersInRange:NSMakeRange([resultString length] - 1, 1)];
            }
            const char* resultCStr = [resultString UTF8String];
            NSLog(@"generateStrings result: %s", resultCStr);
            completion(resultCStr);
        } else {
            NSLog(@"generateStrings result is nil");
            completion("");
        }
    }];
}


void generateUUIDs(int n, void (*completion)(const char*)) {
    [apiInstance generateUUIDsWithN:n completion:^(NSArray<NSString *> * _Nullable result) {
        if (result) {
            NSMutableString *resultString = [NSMutableString string];
            for (NSString *uuid in result) {
                [resultString appendFormat:@"%@,", uuid];
            }
            if ([resultString length] > 0) {
                [resultString deleteCharactersInRange:NSMakeRange([resultString length] - 1, 1)];
            }
            const char* resultCStr = [resultString UTF8String];
            NSLog(@"generateUUIDs result: %s", resultCStr);
            completion(resultCStr);
        } else {
            NSLog(@"generateUUIDs result is nil");
            completion("");
        }
    }];
}

void generateBlobs(int n, int size, NSString *format, void (*completion)(const char*)) {
    [apiInstance generateBlobsWithN:n size:size format:format completion:^(NSArray<NSString *> * _Nullable result) {
        if (result) {
            NSMutableString *resultString = [NSMutableString string];
            for (NSString *blob in result) {
                [resultString appendFormat:@"%@,", blob];
            }
            if ([resultString length] > 0) {
                [resultString deleteCharactersInRange:NSMakeRange([resultString length] - 1, 1)];
            }
            const char* resultCStr = [resultString UTF8String];
            NSLog(@"generateBlobs result: %s", resultCStr);
            completion(resultCStr);
        } else {
            NSLog(@"generateBlobs result is nil");
            completion("");
        }
    }];
}

void verifySignature(NSString *randomData, NSString *signature, void (*completion)(bool)) {
    [apiInstance verifySignatureWithRandomData:randomData signature:signature completion:^(BOOL result) {
        completion(result);
    }];
}

void getUsage(void (*completion)(const char*)) {
    [apiInstance getUsageWithCompletion:^(NSString * _Nullable result) {
        completion([result UTF8String]);
    }];
}
