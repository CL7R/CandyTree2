//
//  PublicPageControl.m
//  dbc2
//
//  Created by CL7RNEC on 12-5-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PublicPageControl.h"

@implementation PublicPageControl
@synthesize pageSearch;
@synthesize activeSearImage;
@synthesize inactiveSearImage;
@synthesize activeImage;
@synthesize inactiveImage;


-(void)dealloc{
    [activeImage release];
    [inactiveImage release];
    [super dealloc];
}

-(id) initWithFrame:(CGRect)frame 
         searchFlag:(int)searchFlag
{
    self = [super initWithFrame:frame];
    activeSearImage= [[UIImage imageNamed:@"btnHuntCheck"] retain];
    inactiveSearImage= [[UIImage imageNamed:@"btnHunt"] retain];
    activeImage = [[UIImage imageNamed:@"btnDotCheck"] retain];
    inactiveImage = [[UIImage imageNamed:@"btnDot"] retain];
    pageSearch=searchFlag;
    return self;
}
-(void) updateDots
{
    for (int i = 0; i < [self.subviews count]; i++)
    {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        if (i==0) {
            if (pageSearch==1) {            
                if (i == self.currentPage) {
                    dot.image = activeSearImage;
                }
                else {
                    dot.image = inactiveSearImage;
                }
            }
            else{
                if (i == self.currentPage) {
                    dot.image = activeImage;
                }
                else {
                    dot.image = inactiveImage;
                }
            }
        }
        else{
            if (i == self.currentPage) {
                dot.image = activeImage;
            }
            else {
                dot.image = inactiveImage;
            }
        }        
    }
}
-(void) setCurrentPage:(NSInteger)page
{
    [super setCurrentPage:page];
    [self updateDots];
}
@end
