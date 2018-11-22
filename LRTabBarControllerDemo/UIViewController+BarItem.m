//
//  UINavigationBar+BarItem.m
//  jiulifang
//
//  Created by hesh on 13-10-29.
//  Copyright (c) 2013年 ilikeido. All rights reserved.
//

#import "UIViewController+BarItem.h"


@implementation UIViewController (BarItem)

- (void)showLeftBarButtonItemWithImage:(NSString *)imageName target:(id)target action:(SEL)action {
    UIImage *image = [UIImage imageNamed:imageName];
    CGRect buttonFrame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = buttonFrame;
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftBarBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];

    spaceItem.width = -15;
    self.navigationItem.leftBarButtonItems = @[spaceItem,leftBarBtn];
//    [self.navigationController.interactivePopGestureRecognizer setDelegate:(id<UIGestureRecognizerDelegate> _Nullable)self];
}

- (void)showRightBarButtonItemWithImage:(NSString *)imageName target:(id)target action:(SEL)action {
    UIImage *image = [UIImage imageNamed:imageName];
    CGRect buttonFrame = CGRectMake(0, 0, image.size.width + 10.0f, image.size.height);
    UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentMode = UIViewContentModeScaleAspectFit;
	button.backgroundColor = [UIColor clearColor];
    button.frame = buttonFrame;
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}


- (void)showLeftBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    /// Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    /// Set text alignment
    //paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:12],
                                  //NSForegroundColorAttributeName:_textColor ? _textColor : textColor,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    CGSize size = [title boundingRectWithSize:CGSizeMake(100, 44) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    
    //CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(100, 44)];
    CGRect buttonFrame = CGRectMake(0, 0, size.width + 20.0f, self.navigationController.navigationBar.frame.size.height);
    UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentMode = UIViewContentModeScaleAspectFit;
	button.backgroundColor = [UIColor clearColor];
    button.frame = buttonFrame;
    button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)showRightBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    /// Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    /// Set text alignment
    //paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:12],
                                  //NSForegroundColorAttributeName:_textColor ? _textColor : textColor,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    CGSize size = [title boundingRectWithSize:CGSizeMake(100, 44) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    

    CGRect buttonFrame = CGRectMake(0, 0, size.width + 20.0f, self.navigationController.navigationBar.frame.size.height);
    UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentMode = UIViewContentModeScaleAspectFit;
	button.backgroundColor = [UIColor clearColor];
    button.frame = buttonFrame;
    button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)showLeftBarButtonItemWithTitle:(NSString *)title BgImageName:(NSString *)imageName target:(id)target action:(SEL)action {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    /// Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    /// Set text alignment
    //paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:12],
                                  //NSForegroundColorAttributeName:_textColor ? _textColor : textColor,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    CGSize size = [title boundingRectWithSize:CGSizeMake(100, 28) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    

    CGRect buttonFrame = CGRectMake(0, 0, size.width + 20.0f, 28);
    UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentMode = UIViewContentModeScaleToFill;
	button.backgroundColor = [UIColor clearColor];
    button.frame = buttonFrame;
    button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [button setTitle:title forState:UIControlStateNormal];
    if(imageName.length > 0)
    {
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)showRightBarButtonItemWithTitle:(NSString *)title BgImageName:(NSString *)imageName target:(id)target action:(SEL)action {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    /// Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    /// Set text alignment
    //paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:12],
                                  //NSForegroundColorAttributeName:_textColor ? _textColor : textColor,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    CGSize size = [title boundingRectWithSize:CGSizeMake(100, 28) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    
    //CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(100, 28)];
    CGRect buttonFrame = CGRectMake(0, 0, size.width + 20.0f, 28);
    UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentMode = UIViewContentModeScaleToFill;
	button.backgroundColor = [UIColor clearColor];
    button.frame = buttonFrame;
    button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [button setTitle:title forState:UIControlStateNormal];
    if(imageName.length > 0)
    {
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)setTitleButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = button;
}

@end
