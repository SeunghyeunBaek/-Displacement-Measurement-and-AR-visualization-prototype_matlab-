global Ratio;
global r_length;
global p_length;

  Ratio = (r_length/p_length);
    
  Ratio_s = num2str(Ratio);

  set(handles.Ratio_etxt,'String',Ratio_s);