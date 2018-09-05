clc; clear all; close all;
ter = input('givme the number of terms: ');
x = input('givme x ' );

exp=1
i=1
sen =0
j=1
j2=1
j3=3
cos=1
g=2
g2=1
g3=2
while i < ter 
  
    exp= exp + (x^i)/factorial(i)
    
    i=i+1
    
end

while j2 < ter 
  
    sen= sen + (x^j)/factorial(j)
    
    j = j + 4
    
    j2 = j2 + 2
    
end
j=3
while j3 < ter 
  
    sen= sen - (x^j)/factorial(j)
    
    j = j + 4
    
    j3 = j3 + 2
    
end

while g2 < ter 
  
    cos= cos - (x^g)/factorial(g)
    
    g = g + 4
    
    g2 = g2 + 2
    
end
g=4

while g3 < ter 
  
    cos= cos + (x^g)/factorial(g)
    
    g = g + 4
    
    g3 = g3 + 2
    
end

cos
sen
exp