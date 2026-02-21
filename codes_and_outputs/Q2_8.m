% --- تنظیمات پروژه شما ---
Fs = 11025;      % فرکانس نمونه برداری
Fc1 = 300;       % فرکانس قطع پایین (Hz)
Fc2 = 3400;      % فرکانس قطع بالا (Hz)
Order = 4;       % مرتبه فیلتر (مرتبه بالاتر برای تقویت واضح تر)

% فرض می‌کنیم سیگنال x_iir و Fs از قبل در محیط Workspace تعریف شده باشند.
% اگر x_iir تعریف نشده است، کد زیر فقط فیلتر را طراحی می کند.

% --- طراحی فیلتر تقویت کننده فرکانس های ضروری (Bandpass) ---
% استفاده از فیلتر Butterworth (استاندارد و پرکاربرد)
[b, a] = butter(Order, [Fc1 Fc2]/(Fs/2), 'bandpass');

% --- اعمال فیلتر بر روی سیگنال ورودی ---
if exist('x_iir', 'var') && ~isempty(x_iir)
    % اعمال فیلتر IIR طراحی شده بر روی سیگنال ورودی
    x_filtered_enhanced = filter(b, a, x_iir);
    
    % نرمال سازی خروجی نهایی (مقیاس دهی به دامنه [-1, 1])
    x_final = x_filtered_enhanced / (max(abs(x_filtered_enhanced)) + eps);
    
    % ذخیره فایل WAV
    audiowrite("x_final_enhanced_vocal.wav", x_final, Fs);
    disp('فیلتر تقویتی (باند گفتار) اعمال شد و فایل "x_final_enhanced_vocal.wav" ذخیره گردید.');
else
    disp('خطا: سیگنال ورودی "x_iir" یافت نشد یا خالی است. فیلتر تنها طراحی شد.');
end

% --- مرحله دوم: درک حساسیت با تضعیف فرکانس های اساسی (Notch Filter) ---
% طراحی فیلتر Notch برای حذف کامل باند گفتار
[b_notch, a_notch] = butter(5, [Fc1 Fc2]/(Fs/2), 'stop');

if exist('x_iir', 'var') && ~isempty(x_iir)
    x_attenuated = filter(b_notch, a_notch, x_iir);
    
    % نرمال سازی
    x_attenuated_norm = x_attenuated / (max(abs(x_attenuated)) + eps);
    
    audiowrite("x_final_attenuated_vocal.wav", x_attenuated_norm, Fs);
    disp('فیلتر تضعیف کننده (Notch) اعمال شد و فایل "x_final_attenuated_vocal.wav" ذخیره گردید.');
else
    disp('نمی‌توان فیلتر تضعیف کننده را اعمال کرد زیرا x_iir موجود نیست.');
end
