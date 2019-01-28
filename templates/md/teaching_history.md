# Teaching History

$for(teaching)$
## $teaching.type$

### $teaching.location$
$if(teaching.dates)$

$teaching.dates$
$endif$
$if(teaching.items)$$for(teaching.items)$

$teaching.items.item$  
$teaching.items.dates$  
$endfor$$endif$
$if(teaching.details)$
$teaching.details$
$endif$
$if(teaching.lectures)$

#### Lectures
$for(teaching.lectures)$

$teaching.lectures.item$
$endfor$
$endif$
$endfor$