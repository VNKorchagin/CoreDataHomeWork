//
//  SKStudent+CoreDataProperties.m
//  CoreDataHomeWork
//
//  Created by Кирилл on 09.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import "SKStudent+CoreDataProperties.h"

@implementation SKStudent (CoreDataProperties)

+ (NSFetchRequest<SKStudent *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SKStudent"];
}

@dynamic email;
@dynamic lastname;
@dynamic name;
@dynamic courses;

@end
