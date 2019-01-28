# $name.first$ $name.middle_initial$ $name.last$

<a href="mailto:$email$"><i class="fas fa-envelope grow"></i> $email$</a>
<div id="social">    
    <a href="https://www.github.com/$social.github$"><i class="fab fa-github fa-2x grow"></i></a>
    <a href="https://www.twitter.com/$social.twitter$"><i class="fab fa-twitter fa-2x grow"></i></a>
    <a href="https://www.linkedin.com/in/$social.linkedin$"><i class="fab fa-linkedin fa-2x grow"></i></a>
    <a href="https://scholar.google.com/citations?user=$social.google_scholar$"><i class="ai ai-linkedin ai-2x grow"></i></a>
    $if(address.coordinates)$<a href="https://maps.google.com/?ll=$address.coordinates.lat$,$address.coordinates.long$"><i class="fas fa-map-marker-alt fa-2x grow"></i></a>$endif$
</div>

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
