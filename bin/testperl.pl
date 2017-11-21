use Redis::Client;

my $client = Redis::Client->new(host => 'localhost', port => 6379);

# work with strings
$client->set(some_key => 'myval');
my $str_val = $client->get('some_key');
print $str_val; # myval

# work with lists
$client->lpush(some_list => 1, 2, 3);
my $list_elem = $client->lindex(some_list => 2);
print $list_elem; # 3

# work with hashes
$client->hset('some_hash', foobar => 42);
my $hash_val = $client->hget('some_hash', 'foobar');
print $hash_val; # 42
