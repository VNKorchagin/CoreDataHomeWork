//
//  SKStudent+CoreDataProperties.h
//  CoreDataHomeWork
//
//  Created by Кирилл on 09.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import "SKStudent+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SKStudent (CoreDataProperties)

+ (NSFetchRequest<SKStudent *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *lastname;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<SKCourse *> *courses;

@end

@interface SKStudent (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(SKCourse *)value;
- (void)removeCoursesObject:(SKCourse *)value;
- (void)addCourses:(NSSet<SKCourse *> *)values;
- (void)removeCourses:(NSSet<SKCourse *> *)values;

@end

NS_ASSUME_NONNULL_END
