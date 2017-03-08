//
//  SKStudent+CoreDataProperties.h
//  CoreDataHomeWork
//
//  Created by Кирилл on 08.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import "SKStudent+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SKStudent (CoreDataProperties)

+ (NSFetchRequest<SKStudent *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *lastname;
@property (nullable, nonatomic, copy) NSString *email;

@end

NS_ASSUME_NONNULL_END
