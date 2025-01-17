//
//  LookinStaticAsyncUpdateTask.m
//  Lookin
//
//  Copyright © 2019 hughkli. All rights reserved.
//

#import "LookinStaticAsyncUpdateTask.h"

@implementation LookinStaticAsyncUpdateTask

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:@(self.oid) forKey:@"oid"];
    [aCoder encodeInteger:self.taskType forKey:@"taskType"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.oid = [[aDecoder decodeObjectForKey:@"oid"] unsignedLongValue];
        self.taskType = [aDecoder decodeIntegerForKey:@"taskType"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (NSUInteger)hash {
    return self.oid ^ self.taskType;
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    if (![object isKindOfClass:[LookinStaticAsyncUpdateTask class]]) {
        return NO;
    }
    LookinStaticAsyncUpdateTask *targetTask = object;
    if (self.oid == targetTask.oid && self.taskType == targetTask.taskType) {
        return YES;
    }
    return NO;
}

@end

@implementation LookinStaticAsyncUpdateTasksPackage

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.tasks forKey:@"tasks"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.tasks = [aDecoder decodeObjectForKey:@"tasks"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
