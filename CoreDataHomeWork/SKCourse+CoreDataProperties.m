//
//  SKCourse+CoreDataProperties.m
//  CoreDataHomeWork
//
//  Created by Кирилл on 09.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import "SKCourse+CoreDataProperties.h"

@implementation SKCourse (CoreDataProperties)

+ (NSFetchRequest<SKCourse *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SKCourse"];
}

@dynamic name;
@dynamic discipline;
@dynamic sphere;
@dynamic students;

@end
