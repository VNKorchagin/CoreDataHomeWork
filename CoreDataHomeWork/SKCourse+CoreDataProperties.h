//
//  SKCourse+CoreDataProperties.h
//  CoreDataHomeWork
//
//  Created by Кирилл on 09.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import "SKCourse+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SKCourse (CoreDataProperties)

+ (NSFetchRequest<SKCourse *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *discipline;
@property (nullable, nonatomic, copy) NSString *sphere;
@property (nullable, nonatomic, retain) NSSet<SKStudent *> *students;

@end

@interface SKCourse (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(SKStudent *)value;
- (void)removeStudentsObject:(SKStudent *)value;
- (void)addStudents:(NSSet<SKStudent *> *)values;
- (void)removeStudents:(NSSet<SKStudent *> *)values;

@end

NS_ASSUME_NONNULL_END
