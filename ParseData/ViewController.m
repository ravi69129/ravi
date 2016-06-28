//
//  ViewController.m
//  ParseData
//
//  Created by fis on 07/05/16.
//  Copyright © 2016 fis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSDictionary *jsonDictionary;
    NSDictionary *jsonDict;
    NSMutableArray *array;
    

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor darkGrayColor];
    NSError *error;
    NSData *data=[@"{\"user\": {\"name\":\"ramesh\",\"mobile\": \"123456\",\"title\": \"good\"}}"dataUsingEncoding:NSUTF8StringEncoding];

    jsonDictionary=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    jsonDict=[jsonDictionary objectForKey:@"user"];
    user *user1=[[user alloc]init];
    user1.name=[jsonDict objectForKey:@"name"];
    user1.dob=[jsonDict objectForKey:@"mobile"];
    user1.title=[jsonDict objectForKey:@"title"];
    array=[[NSMutableArray alloc]init];
    [array addObject:user1.name];
    [array addObject:user1.dob];
    [array addObject:user1.title];
    NSLog(@"user info%@",jsonDict);
    NSLog(@"user total info%@",jsonDictionary);
    NSLog(@"user info in array%@",array);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithFrame:CGRectZero];
    }
    cell.textLabel.text=[array objectAtIndex:indexPath.row];
    cell.backgroundColor=[UIColor darkGrayColor];
    cell.textLabel.backgroundColor=[UIColor darkGrayColor];
    cell.textLabel.textColor=[UIColor yellowColor];
    return cell;
}


@end
