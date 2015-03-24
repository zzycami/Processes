//
//  ViewController.m
//  Processes
//
//  Created by damingdan on 15/3/24.
//  Copyright (c) 2015年 kuteng. All rights reserved.
//

#import "ViewController.h"
#import "Processes.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, retain) NSArray* processes;
@end

@implementation ViewController
@synthesize processes = _processes;

- (void) refreshProcess{
    self.processes = [[UIDevice currentDevice] runningProcesses];
    if (self.processes == nil) {
        self.processes = [NSArray new];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshProcess];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.processes.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* CellIdentifier = @"ProcessCell";
    UITableViewCell* celll = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    celll.textLabel.text = self.processes[indexPath.row][@"ProcessID"];
    celll.detailTextLabel.text = self.processes[indexPath.row][@"ProcessName"];
    return celll;
}

@end
