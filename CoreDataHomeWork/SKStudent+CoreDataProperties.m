//
//  SKStudent+CoreDataProperties.m
//  CoreDataHomeWork
//
//  Created by Кирилл on 08.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import "SKStudent+CoreDataProperties.h"

@implementation SKStudent (CoreDataProperties)

+ (NSFetchRequest<SKStudent *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SKStudent"];
}

@dynamic name;
@dynamic lastname;
@dynamic email;

@end
