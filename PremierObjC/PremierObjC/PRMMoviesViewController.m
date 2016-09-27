#import "PRMMoviesViewController.h"

@interface PRMMoviesViewController ()

@property (nonatomic, copy) NSArray *movies;

@end

@implementation PRMMoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Top Movies";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellIdentifier"];
    NSURL *URL = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/top_rated?api_key=e4f9e61f6ffd66639d33d3dde7e3159b"];
    [[[NSURLSession sharedSession] dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.movies = JSON[@"results"];
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];

    }] resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *movie = self.movies[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = movie[@"title"];
    return cell;
}

@end
