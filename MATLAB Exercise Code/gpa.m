Micah={'62','52','71','80','83'};
Chirag={'82','55','60','56','79'};
total = length(Micah).*0.5;

% Determining GPA of every course of Micah and Chirag
for i=1:length(Micah)
   if ge(Micah{i},'0') & le(Micah{i},'49')
       markM(i) = 0;
   elseif ge(Micah{i},'50') & le(Micah{i},'52')
       markM(i) = 0.7;
   elseif ge(Micah{i},'53') & le(Micah{i},'56')
       markM(i) = 1.0;
   elseif ge(Micah{i},'57') & le(Micah{i},'59')
       markM(i) = 1.3;
   elseif ge(Micah{i},'60') & le(Micah{i},'62')
       markM(i) = 1.7;
   elseif ge(Micah{i},'63') & le(Micah{i},'66')
       markM(i) = 2.0;
   elseif ge(Micah{i},'67') & le(Micah{i},'69')
       markM(i) = 2.3;
   elseif ge(Micah{i},'70') & le(Micah{i},'72')
       markM(i) = 2.7;    
   elseif ge(Micah{i},'73') & le(Micah{i},'76')
       markM(i) = 3.0;
   elseif ge(Micah{i},'77') & le(Micah{i},'79')
       markM(i) = 3.3;
   elseif ge(Micah{i},'80') & le(Micah{i},'84')
       markM(i) = 3.7;
   else
       markM(i) = 4.0; 
   end
   
     if markM(i) >= 2.3
        yellowM(i) = 1;
     else 
        yellowM(i) = 0;
     end
     
   if ge(Chirag{i},'0') & le(Chirag{i},'49')
       markC(i) = 0;
   elseif ge(Chirag{i},'50') & le(Chirag{i},'52')
       markC(i) = 0.7;
   elseif ge(Chirag{i},'53') & le(Chirag{i},'56')
       markC(i) = 1.0;
   elseif ge(Chirag{i},'57') & le(Chirag{i},'59')
       markC(i) = 1.3;
   elseif ge(Chirag{i},'60') & le(Chirag{i},'62')
       markC(i) = 1.7;
   elseif ge(Chirag{i},'63') & le(Chirag{i},'66')
       markC(i) = 2.0;
   elseif ge(Chirag{i},'67') & le(Chirag{i},'69')
       markC(i) = 2.3;
   elseif ge(Chirag{i},'70') & le(Chirag{i},'72')
       markC(i) = 2.7;    
   elseif ge(Chirag{i},'73') & le(Chirag{i},'76')
       markC(i) = 3.0;
   elseif ge(Chirag{i},'77') & le(Chirag{i},'79')
       markC(i) = 3.3;
   elseif ge(Chirag{i},'80') & le(Chirag{i},'84')
       markC(i) = 3.7;
   else
       markC(i) = 4.0; 
   end
   
     if markC(i) >= 2.3
        yellowC(i) = 1;
     else 
        yellowC(i) = 0;
     end
end

% Weight of 0.5 per course and sum
markC = 0.5.*markC;
markM = 0.5.*markM;
GPAM = sum(markM)/total
GPAC = sum(markC)/total

% Scholarships for Micah
  if GPAM >= 1.3
    disp('Micah receives the Orange Scholarship')
  end 
  
  if GPAM >= 2.2
     disp('Micah receives the Blue Scholarship')
  end 
  
  if sum(yellowM) >= 3
     disp('Micah receives the Yellow Scholarship')
  end

% Scholarships for Chirag
  if GPAC >= 1.3
    disp('Chirag receives the Orange Scholarship')
  end 
  
  if GPAC >= 2.2
     disp('Chirag receives the Blue Scholarship')
  end
  
  if sum(yellowC) >= 3
     disp('Chirag receives the Yellow Scholarship')
  end