//
//  SKStudentsViewController.m
//  CoreDataHomeWork
//
//  Created by Кирилл on 01.03.17.
//  Copyright © 2017 Кирилл. All rights reserved.
//

#import "SKStudentsViewController.h"
#import "SKStudentInfoViewController.h"
#import "SKStudent+CoreDataClass.h"
#import "SKUserCell.h"

@interface SKStudentsViewController ()

@end

static NSString *newStudentIdentifier = @"addNewStudent";
static NSString *editStudentIdentifier = @"editStudent";

@implementation SKStudentsViewController

@synthesize fetchedResultsController = _fetchedResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - fetched result

- (NSFetchedResultsController *) fetchedResultsController
{
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SKStudent"
                                              inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Set sort descriptors
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSSortDescriptor *lastnameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastname" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[ nameDescriptor, lastnameDescriptor ]];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:self.managedObjectContext
                                          sectionNameKeyPath:nil
                                                   cacheName:nil];
    aFetchedResultsController.delegate = self;
    
    NSError *error = nil;
    
    if (![aFetchedResultsController performFetch:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        
        abort();
    }
    
    _fetchedResultsController = aFetchedResultsController;
    return _fetchedResultsController;
}

#pragma mark - Table view data source

- (void)configureCell:(SKUserCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    SKStudent *student = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.name, student.lastname];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SKUserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell"];
        
    [self configureCell:cell atIndexPath:indexPath];
        
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.indexPathForEdit = indexPath;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:editStudentIdentifier sender:nil];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:newStudentIdentifier]) {
    
        SKStudentInfoViewController *vc = [segue destinationViewController];
    
        vc.studentViewController = self;
        
        vc.isEdit = NO;
    }
    
    if ([segue.identifier isEqualToString:editStudentIdentifier]) {
        
        SKStudentInfoViewController *vc = [segue destinationViewController];
        
        vc.studentViewController = self;
        vc.title = @"Edit student";
        vc.isEdit = YES;
    }
}

@end
