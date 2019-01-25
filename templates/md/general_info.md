# $name.first$ $name.middle_initial$ $name.last$

<i class="fas fa-at"></i>$email$  
<i class="fas fa-phone-volume"></i>$phone$  

<i class="fab fa-twitter"></i>$social.github$  
<i class="fab fa-twitter"></i>$social.twitter$  
<i class="fab fa-twitter"></i>$social.linkedin$  
<i class="fab fa-twitter"></i>$social.google_scholar$

$address.line1$  
$address.line2$  
$address.city$, $address.state$  $address.zip$

# Research Interests

$for(research_interests)$
## $research_interests.topic$
$research_interests.details$

$endfor$

# Education

$for(education)$
$education.year$  
$education.degree$ in $education.major$  
$if(education.minor)$
Minor in $education.minor$  
$endif$
$education.school$  
$education.details$

$endfor$

# Publications
