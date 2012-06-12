//
//  webViewLoadRequestTracking.m
//  ObjC-Mix
//
//  Created by Florian Knorn on 15/06/2011.
//  Copyright 2011 Florian Knorn. All rights reserved.
//

#import "webViewLoadRequestTracking.h"
#import "NSURL+EncryptedFileURLProtocol.h"

@implementation webViewLoadRequestTracking

@synthesize _webView, loadRequestCount;

- (void)setNKWebView:(UIWebView*)webView {
	self._webView = webView;
}

// ### YOU MAY NEED TO HAVE TO CHANGE SOMETHING HERE!! READ THIS!! ###
// The "objectAtIndex:1" below means that the webview is the 2st object in the stack of things displayed (the 1st element being your html page itself)
// If you add other visual elements before creaing the NKWebView, you may have to increase this number !!
- (void)enableLoadRequestTracking {
	UIWebView* remoteWebView = [[NSArray arrayWithArray:[self._webView subviews]] objectAtIndex:1]; // <- may have to change this value
	remoteWebView.delegate = self; // make this class the delegate for the webView, so that load requests can be intercepted
	NSLog(@"load encrypted main-u");
	
	// LOAD THE PAGE TO BE UNENCRYPTED
	NSString *indexPath = [[NSBundle mainBundle] pathForResource:@"main-u" ofType:@"html" inDirectory:@"HTML"];
    NSURL *url = [NSURL encryptedFileURLWithPath:indexPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [remoteWebView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView { // the webview starts loading "something"
	self.loadRequestCount++; // => increment counter
	NSLog(@"start load, c=%i",self.loadRequestCount);
	
	NSLog(@"bout to load next. current: %@",[[[self._webView request]URL]absoluteString]);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView { // the webview finished loading something
	self.loadRequestCount--; // => decrement counter
	NSLog(@"finish load, c=%i",self.loadRequestCount);
			
	//UIWebView* remoteWebView = [[NSArray arrayWithArray:[self._webView subviews]] objectAtIndex:1];
	
	//[remoteWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
	
	NSLog(@"Finished load. Current: %@",[[[self._webView request]URL]absoluteString]);
	
	
	
	
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error { // the webview encountered an error loading something
	self.loadRequestCount--; // => decrement counter
	NSLog(@"error load, c=%i, error: %@",self.loadRequestCount,error);
}


- (id)init {
	self = [super init];
	if (self) {
		self.loadRequestCount = 0; // init counter with 0
	}
	return self;
}

- (void)dealloc {
	self._webView = nil;
 	[super dealloc];
}

@end