//
//  BAViewController.m
//  Prayer Times Example
//
//  Created by Ameir Al-Zoubi on 8/19/14.
//  Copyright (c) 2014 Batoul Apps. All rights reserved.
//

#import "BAViewController.h"
#import <BAPrayerTimes/BAPrayerTimes.h>

@interface BAViewController ()

@property (strong, nonatomic) BAPrayerTimes *prayerTimes;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation BAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateStyle = NSDateFormatterNoStyle;
    self.dateFormatter.timeStyle = NSDateFormatterShortStyle;

    self.prayerTimes = [[BAPrayerTimes alloc] initWithDate:[NSDate date]
                                                  latitude:51.5
                                                 longitude:-0.1167
                                                  timeZone:[NSTimeZone timeZoneWithName:@"Europe/London"]
                                                    method:BAPrayerMethodMCW
                                                    madhab:BAPrayerMadhabHanafi];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Fajr";
            cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.fajrTime];
            break;
        case 1:
            cell.textLabel.text = @"Sunrise";
            cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.sunriseTime];
            break;
        case 2:
            cell.textLabel.text = @"Dhuhr";
            cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.dhuhrTime];
            break;
        case 3:
            cell.textLabel.text = @"Asr";
            cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.asrTime];
            break;
        case 4:
            cell.textLabel.text = @"Maghrib";
            cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.maghribTime];
            break;
        case 5:
            cell.textLabel.text = @"Isha";
            cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.ishaTime];
            break;
        case 6:
            cell.textLabel.text = @"Fajr Tomorrow";
            cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.tomorrowFajrTime];
            break;
    }
    
    return cell;
}

@end
