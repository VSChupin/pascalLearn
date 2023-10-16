// программа должна рассчитать чистую доходность по облигации к погашению.
program invest;
uses DateUtils, SysUtils;
var
result, nominal_rub, period, days: real;
dohod, raznica, couponsWithNDFL, price_rub, coupons_rub, cost_rub, broker, burse, couponValue: real;
strRazn, strDays,strDate1, strDate2, strDohod, strPrice, strPlus, strMinus: string;
date1, date2: TDate;
// функция вычисляет количество дней между датами
function DaysBetween(date1, date2: TDate): real;
begin
  result := Trunc(Abs(date2 - date1));
end;
// ТЕЛО ПРОГРАММЫ 
begin
FormatSettings.ShortDateFormat := 'dd.MM.yyyy';
// Общая справка
    writeln('               Программа раcсчитает чистую годовую доходность по облигациям              ');
    writeln('------------------------------------');
    writeln('"Расчет доходности облигации к погашению происходит в 3 этапа:');
    writeln('1. Расчет расходов');
    writeln('2. Расчет суммы к погашению');
    writeln('3. Расчет доходности к погашению"'); 
    writeln('------------------------------------');
    writeln('*Начнем с расчета расходов..*');
    writeln('------------------------------------');
    writeln('Введите цену (в ВТБ цена учитывает НКД):');
// вводим цену
    readln(price_rub);
    strPrice := FormatFloat('#0.00', price_rub);
    writeln('Введена цена бумаги с учетом НКД: ', strPrice);
// расcчитываем расход
    broker := price_rub * 0.05 / 100; 
    burse :=  price_rub * 0.01 / 100;
    cost_rub := price_rub + broker + burse; 
    strMinus := FormatFloat('#0.00', cost_rub);
    writeln(''); 
    writeln('Расходы на покупку, с учетом комиссий биржи и брокера = ', strMinus);
// расcчитываем сумму к погашению 
    writeln('------------------------------------');
    writeln('*Расcчитаем сумму к погашению..*');
    writeln('------------------------------------');
    writeln('Укажите день, месяц, год покупки, в формате ДД-ММ-ГГГГ : ');
    readln(strDate1);
    writeln('Укажите день, месяц, год погашения, в формате ДД-ММ-ГГГГ : ');
    readln(strDate2);
    date1 := StrToDate(strDate1);
    date2 := StrToDate(strDate2);
    days := DaysBetween(date1, date2);
    writeln('');
    strDays := FormatFloat('#0', days);  
    writeln('Количество дней владения бумагой: ', strDays);
    writeln('');
    writeln('Укажите номинал:');
    nominal_rub:= 0;
    readln(nominal_rub);
    writeln('Укажите размер купона и количество выплат в год:');
    readln(couponValue);
    readln(period);
    coupons_rub := couponValue * (days / 365 * period);
    couponsWithNDFL := (coupons_rub - (coupons_rub * 13 / 100)) + nominal_rub; 
    strPlus := FormatFloat('#0.00', couponsWithNDFL);
    writeln('');  
    writeln('Сумма к погашению = ',strPlus);
//расчитываем доходность к погашению;
writeln('------------------------------------');
writeln('*Расcчитываем итоговую доходность к погашению..*');
writeln('------------------------------------');
raznica := couponsWithNDFL - cost_rub;
strRazn := FormatFloat('#0.00', raznica);
if raznica <= 0 then
    begin
    writeln('');
    writeln ('облигация убыточна, не рекомендуется к покупке');
    end;
if raznica > 0 then
    begin
    dohod := (raznica * 100 / cost_rub / days * 365);
    strDohod := FormatFloat('#0.00', dohod);
    writeln('Разница суммы погашения и расходов на момент покупки : ',strRazn);
    writeln('За ',strDays,' дней, доходность составит около ',strDohod,'% годовых');
    end
end.