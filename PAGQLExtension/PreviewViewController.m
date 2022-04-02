//
//  PreviewViewController.m
//  PAGQLExtension
//
//  Created by king on 2022/4/2.
//

#import "PreviewViewController.h"

#import <Quartz/Quartz.h>

#import <PAGPlayer.h>
#import <PAGSurface.h>
#import <PAGView.h>

static NSString *const kPlayerRepeatCount = @"PlayerRepeatCount";

#define myDomain @"com.0x1306a94.pag.ql"

@interface PreviewViewController () <QLPreviewingController>
@property (nonatomic, strong) PAGView *playerView;
@end

@implementation PreviewViewController

- (NSString *)nibName {
    return @"PreviewViewController";
}

- (void)loadView {
    [super loadView];
    // Do any additional setup after loading the view.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playerView = [[PAGView alloc] init];
    self.playerView.layer.backgroundColor = NSColor.orangeColor.CGColor;
    self.playerView.autoresizingMask = kCALayerWidthSizable | kCALayerHeightSizable;
    [self.view addSubview:self.playerView];
}

- (void)viewDidLayout {
    [super viewDidLayout];
    self.playerView.frame = self.view.bounds;
}

- (void)preparePreviewOfFileAtURL:(NSURL *)url completionHandler:(void (^)(NSError *_Nullable))handler {

    // Add the supported content types to the QLSupportedContentTypes array in the Info.plist of the extension.

    // Perform any setup necessary in order to prepare the view.

    // Call the completion handler so Quick Look knows that the preview is fully loaded.
    // Quick Look will display a loading spinner while the completion handler is not called.

    NSNumber *value = [[NSUserDefaults standardUserDefaults] objectForKey:kPlayerRepeatCount];
    if (value == nil) {
        [[NSUserDefaults standardUserDefaults] registerDefaults:@{kPlayerRepeatCount : @1}];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    [self.playerView setPath:url.path];
    [self.playerView setProgress:0];
    [self.playerView flush];
    [self.playerView setRepeatCount:value ? [value intValue] : 1];
    [self.playerView play];

    PAGFile *pagFile = (PAGFile *)[self.playerView getComposition];
    self.view.frame = NSMakeRect(0, 0, pagFile.width, pagFile.height);
    handler(nil);
}

@end

