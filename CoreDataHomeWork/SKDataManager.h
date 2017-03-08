//
//  SKDataManager.h
//  CoreDataHomeWork
//
//  Created by Кирилл on 05.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface SKDataManager : NSObject

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

+ (SKDataManager *) sharedManager;

@end
