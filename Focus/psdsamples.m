%% Make some sample phase space plots
%
% Dave Reens, 5/8/19, for thesis

gc = .7;
figs = [];

%% initial
figs(end+1) = figure('Position',[0 300 300 300]);
N = 1e4;
x = randn(N,1);
v = randn(N,1);
plot(x,v,'k.','MarkerSize',1)
L = 8;
xlim([-L L])
ylim([-L L])


%% free flight
figs(end+1) = figure('Position',[300 300 300 300]);
t = 2;
plot(x,v,'k.','MarkerSize',1,'Color',ones(1,3)*gc)
hold on
plot(x+v*t,v,'k.','MarkerSize',1)
xlim([-L L])
ylim([-L L])


%% hexapole action
figs(end+1) = figure('Position',[0 0 300 300]);
plot(x+v*t,v,'k.','MarkerSize',1,'Color',ones(1,3)*gc)
hold on

th = .25*pi;

% do a rotation. first go polar.
xx = x+v*t;
a = atan2(v,xx);
r = sqrt(v.^2+xx.^2);
a = a - th;
xxx = r.*cos(a);
vv = r.*sin(a);

plot(xxx,vv,'k.','MarkerSize',1)
xlim([-L L])
ylim([-L L])

% show the circle.
th = linspace(0,2*pi,100);
hold on
plot(L*.9*cos(th),L*.9*sin(th),'k-')

%% free flight again
figs(end+1) = figure('Position',[300 0 300 300]);
plot(xxx,vv,'k.','MarkerSize',1,'Color',ones(1,3)*gc)
hold on

t=2;
plot(xxx+vv*t,vv,'k.','MarkerSize',1)
xlim([-L L])
ylim([-L L])
