## Home Wrecker
home_wrecker is a gem meant for load testing that utilizes siege https://www.joedog.org/siege-home/

Make sure you have siege installed with `brew install siege` or some other flavor of install

This is currently working with siege 3.0.7, ruby 2.0.1


install the gem
```sh
  $ gem install home_wrecker`
```

you should see
  ```sh
  $ confing file created. Please update config.rb and try again
  ```
open the config.rb file that was created and update for your needs
```ruby
  #!/usr/bin/env ruby
  $endpoints = [
    # example 'users/13',
    # example 'users/4',
  ]
  $urls = [
    #'https://api.example.com',
    #'https://api.example2.com'
  ]
  # $extra_args = " example: -H 'Authorization: Token token=\"example_token\"' -H 'X_API_EMAIL: example@example.com'"
  $verbose = false
  $seconds = '3'
```
run the home_wrecker wreck command
```sh
$ home_wrecker wreck
```
output should be
```sh
$ hitting https://api.example.com/users/13 for 3 seconds
$ hitting https://api.example2.com/users/13 for 3 seconds
$ hitting https://api.example.com/users/4 for 3 seconds
$ hitting https://api.example2.com/users/4 for 3 seconds
...
```
then a fomatted html file should open, showing you the results of the test

<table class="table table-striped"><thead>
<th>https://api.example.com</th>
<th>https://api.example2.com</th>
</thead><tbody>
<tr align="top">
<td>
<span class='url'>https://api.example.com/users/13</span><br />
** SIEGE 3.0.7<br/>
** Preparing 15 concurrent users for battle.<br/>
The server is now under siege...<br/>
<br/>
Lifting the server siege...-      done.<br/>
<br/>
Transactions:		           20 hits<br/>
Availability:		        100.00 %<br/>
Elapsed time:		        2.75 secs<br/>
Data transferred:	        0.08 MB<br/>
Response time:		        2.10 secs<br/>
Transaction rate:	        6.00 trans/sec<br/>
Throughput:		        0.03 MB/sec<br/>
Concurrency:		        11.00<br/>
Successful transactions:           15<br/>
Failed transactions:	           0<br/>
Longest transaction:	        2.00<br/>
Shortest transaction:	        1.03<br/>
 <br/>
</td>
<td>
<span class='url'>https://api.example2.com/users/13</span><br />
** SIEGE 3.0.7<br/>
** Preparing 15 concurrent users for battle.<br/>
The server is now under siege...<br/>
<br/>
Lifting the server siege...-      done.<br/>
<br/>
Transactions:		          17 hits<br/>
Availability:		      100.00 %<br/>
Elapsed time:		        2.98 secs<br/>
Data transferred:	        0.08 MB<br/>
Response time:		        1.84 secs<br/>
Transaction rate:	        5.70 trans/sec<br/>
Throughput:		        0.03 MB/sec<br/>
Concurrency:		       10.49<br/>
Successful transactions:          17<br/>
Failed transactions:	           0<br/>
Longest transaction:	        2.74<br/>
Shortest transaction:	        0.90<br/>
 <br/>
</td>
</tr>
<tr align="top">
<td>
<span class='url'>https://api.example.com/users/490</span><br />
** SIEGE 3.0.7<br/>
** Preparing 15 concurrent users for battle.<br/>
The server is now under siege...<br/>
<br/>
Lifting the server siege...-      done.<br/>
<br/>
Transactions:		          70 hits<br/>
Availability:		      100.00 %<br/>
Elapsed time:		        2.98 secs<br/>
Data transferred:	        0.06 MB<br/>
Response time:		        0.59 secs<br/>
Transaction rate:	       23.49 trans/sec<br/>
Throughput:		        0.02 MB/sec<br/>
Concurrency:		       13.78<br/>
Successful transactions:          70<br/>
Failed transactions:	           0<br/>
Longest transaction:	        1.06<br/>
Shortest transaction:	        0.48<br/>
 <br/>
</td>
<td>
<span class='url'>https://api.example2.com/users/490</span><br />
** SIEGE 3.0.7<br/>
** Preparing 15 concurrent users for battle.<br/>
The server is now under siege...<br/>
<br/>
Lifting the server siege...-      done.<br/>
<br/>
Transactions:		          23 hits<br/>
Availability:		      100.00 %<br/>
Elapsed time:		        2.98 secs<br/>
Data transferred:	        0.05 MB<br/>
Response time:		        1.58 secs<br/>
Transaction rate:	        7.72 trans/sec<br/>
Throughput:		        0.02 MB/sec<br/>
Concurrency:		       12.16<br/>
Successful transactions:          23<br/>
Failed transactions:	           0<br/>
Longest transaction:	        2.36<br/>
Shortest transaction:	        0.67<br/>
 <br/>
</td>
</tr>
</table>

## TODO:
Find a better way to assign the variables.  Globals probably aren't the best. Perhaps a yml file?

Prettier html
Remove verbose option and use javascript to hide / show requests





