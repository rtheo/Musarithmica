f = scale; d = 1; k = 8;
fs = d/(128*k); t = fs:fs:d;
for i=1:length(f)
    tone = signal( f(i), t);
    sound(tone), pause(0.5)
end