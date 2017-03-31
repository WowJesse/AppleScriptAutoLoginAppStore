//
//  ViewController.m
//  MacAutoLoginAppStore
//
//  Created by 张明辉 on 17/3/31.
//  Copyright © 2017年 jesse. All rights reserved.
//

#import "ViewController.h"

#define kUserName   @"username"
#define kPwd   @"pwd"

@interface ViewController ()
@property (weak) IBOutlet NSTextField *username;
@property (weak) IBOutlet NSTextField *pwd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.username.stringValue = [[NSUserDefaults standardUserDefaults] valueForKey:kUserName]?:@"";
    self.pwd.stringValue = [[NSUserDefaults standardUserDefaults] valueForKey:kPwd]?:@"";
}

- (IBAction)click:(id)sender {
    
    if ([self.username.stringValue isEqualToString:@""]
        || [self.pwd.stringValue isEqualToString:@""]) {
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:self.username.stringValue forKey:kUserName];
    [[NSUserDefaults standardUserDefaults] setObject:self.pwd.stringValue forKey:kPwd];
    
    
    NSBundle *bunlde = [NSBundle mainBundle];
    NSString *scriptPath = [bunlde pathForResource:@"appstore"
                                            ofType:@"scpt"
                                       inDirectory:nil];
    NSLog(@"%@",scriptPath);
    if (scriptPath)
    {
        NSTask *task = [[NSTask alloc] init];
        NSArray *a = [NSArray arrayWithObjects:scriptPath, self.username.stringValue?:@"",self.pwd.stringValue?:@"", nil];
        task = [NSTask launchedTaskWithLaunchPath:@"/usr/bin/osascript" arguments:a];
        
        NSLog(@"%@",task);
    }
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
