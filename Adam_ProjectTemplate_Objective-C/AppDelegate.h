//
//  AppDelegate.h
//  Adam_ProjectTemplate_Objective-C
//
//  Created by Adam on 2021/9/12.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;


@end

