//
//  ViewController.m
//  TakeASelfie
//
//  Created by Shannon Armon on 6/3/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

#import "ViewController.h"
#import "FilterCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;


@end

@implementation ViewController

{
    NSArray * filters;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = self.original;
    
    filters = [CIFilter filterNamesInCategory:kCICategoryColorEffect];
    
    self.filterCollectionView.dataSource = self;
    
    self.filterCollectionView.delegate = self;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return filters.count;

}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    FilterCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"filterCell" forIndexPath:indexPath];
    
    NSString * filterName = filters[indexPath.item];
    
    cell.imageView.image = [self filterImage:self.original withName:filterName];
    
    
    return cell;
}

- (UIImage *)filterImage:(UIImage *)originalImage withName:(NSString *)filterName {

    CIContext * context = [CIContext contextWithOptions:nil];
    
    CIImage * image = [CIImage imageWithCGImage:originalImage.CGImage];
    
    CIFilter * filter = [CIFilter filterWithName:filterName];
    
    [filter setValue:image forKey:kCIInputImageKey];
    
//    [filter setValue:@0.8f forKey:kCIInputIntensityKey];
    
    CIImage * result = [filter valueForKey:kCIOutputImageKey];
    
    CGRect extent = [result extent];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:extent];
    
    return [UIImage imageWithCGImage:cgImage];

}

@end
