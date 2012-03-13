//
//  Customer.m
//  CVS-Tycoon
//
//  Created by Zhang Zhe on 2/6/12.
//  Copyright (c) 2012 AvalonGameArt. All rights reserved.
//

#import "Categories.h"
#import "Customer.h"
#import "AnimationComponent.h"

@implementation Customer

-(id)init
{
    self = [super init];
    if(self)
    {
        model = [CCSprite spriteWithSpriteFrameName:@"dog1"];
        [self addChild:model];

        [[self animationComponent] loadPlistForAnimation:@"dog_animation"];
        [[self animationComponent] playAnimation:@"walkDownRight" onModel:model repeat:YES];
    }
    return self;
}

-(id)initWithMapInfo:(MapNavInfo *)mapNode
{
    self = [self init];
    if(self)
    {
        moveComp = [[MovementComponent alloc] initWithOwner:self WithTileMap:mapNode];
        [moveComp setMaxSpeed:10.0f];
        
    }
    return self;
}

-(void)update:(ccTime)deltaTime
{
    [super update:deltaTime];
    [moveComp update:deltaTime];
}

-(void)moveTo:(Vector2D)targetPosition
{
    [moveComp setTargetPosition:targetPosition];
    [moveComp setSeekOn:YES];
    [moveComp setMaxSpeed:20.0f];
}

@end
