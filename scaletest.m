f = scale; d = 1; k = 8;
f = scale; d = 1; k = 8;
fs = d/(128*k); t = fs:fs:d;
for i=1 + floor(option/4):length(f)
    switch option
    case 1,
        tone = signal( f(1:i), t);
    case 2,
        tone = signal( f(i), t);
     case 3, % odd reference scale
         if mod(i,2), tone = signal( f(1:2:i), t);  end
      case 4, % even reference scale
          if mod(i,2)==0, tone = signal( f(2:2:i), t); end
    end
    sound(tone), pause(0.25)
end
