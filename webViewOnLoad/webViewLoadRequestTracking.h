//
//  webViewLoadRequestTracking.h
//  ObjC-Mix
//
//  Created by Florian Knorn on 15/06/2011.
//  Copyright 2011 Florian Knorn. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface webViewLoadRequestTracking : NSObject <UIWebViewDelegate> {
	UIWebView* _webView;
	int loadRequestCount;
}

- (void)enableLoadRequestTracking;

@property (retain) UIWebView* _webView;
@property (nonatomic, assign) int loadRequestCount;

@end
