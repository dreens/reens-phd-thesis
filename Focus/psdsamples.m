%% Make some sample phase space plots
%
% Dave Reens, 5/8/19, for thesis

gc = .7;
figs = [];
ms = 1;

%% initial
figs(end+1) = figure('Position',[0 300 300 300]);
N = 1e5;
x = randn(N,1);
v = randn(N,1);
plot(x,v,'k.','MarkerSize',ms)
L = 8;
xlim([-L L])
ylim([-L L])


%% free flight
figs(end+1) = figure('Position',[300 300 300 300]);
t = 2;
plot(x,v,'k.','MarkerSize',ms,'Color',ones(1,3)*gc)
hold on
plot(x+v*t,v,'k.','MarkerSize',ms)
xlim([-L L])
ylim([-L L])


%% hexapole action
figs(end+1) = figure('Position',[0 0 300 300]);
plot(x+v*t,v,'k.','MarkerSize',ms,'Color',ones(1,3)*gc)
hold on

th = .25*pi;

% do a rotation. first go polar.
xx = x+v*t;
a = atan2(v,xx);
r = sqrt(v.^2+xx.^2);
a = a - th;
xxx = r.*cos(a);
vv = r.*sin(a);

plot(xxx,vv,'k.','MarkerSize',ms)
xlim([-L L])
ylim([-L L])

% show the circle.
% th = linspace(0,2*pi,100);
% hold on
% plot(L*.9*cos(th),L*.9*sin(th),'k-')

%% free flight again
figs(end+1) = figure('Position',[300 0 300 300]);
plot(xxx,vv,'k.','MarkerSize',ms,'Color',ones(1,3)*gc)
hold on

t=2;
plot(xxx+vv*t,vv,'k.','MarkerSize',ms)
xlim([-L L])
ylim([-L L])

%% velocity compression
figs(end+1) = figure('Position',[600 300 300 300]);
plot(x,v,'k.','MarkerSize',ms,'Color',ones(1,3)*gc)
hold on
plot(x*2,v/2,'k.','MarkerSize',ms)
xlim([-L L])
ylim([-L L])

%% spatial compression
figs(end+1) = figure('Position',[600 0 300 300]);
plot(x,v,'k.','MarkerSize',ms,'Color',ones(1,3)*gc)
hold on
plot(x/2,v*2,'k.','MarkerSize',ms)
xlim([-L L])
ylim([-L L])

%% Print everything out
for i=1:length(figs)
    a = get(figs(i),'Children');
    set(a,'Visible','off');
    print(figs(i),['PSM' num2str(i)],'-dpng','-r300')
end
