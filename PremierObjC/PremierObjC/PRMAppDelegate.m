#import "PRMAppDelegate.h"
#import "PRMMoviesViewController.h"

@interface PRMAppDelegate ()

@end

@implementation PRMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    PRMMoviesViewController *moviesViewController = [[PRMMoviesViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:moviesViewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
