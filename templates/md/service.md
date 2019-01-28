# Service
$for(service)$  
$service.dates$  
$service.title$  
$if(service.link)$<a href="$service.link$">$service.item$</a>  $endif$  
$service.location$  
$if(service.details)$$service.details$  $endif$

$endfor$
