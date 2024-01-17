%��ʾ����ʱ��仯����
h = figure();				% ����ͼ�δ���
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');	% �ر���صľ�����ʾ����Ϊ�����˷ǹ����ӿڣ�
jFrame = get(h,'JavaFrame');	% ��ȡ�ײ� Java �ṹ��ؾ��
pause(0.1);					% �� Win 10��Matlab 2017b �����²���ͣ�ٻᱨ Java �ײ���󡣸��˸�����Ҫ���Խ���ʵ����֤
set(jFrame,'Maximized',1);	%���������Ϊ�棨0 Ϊ�٣�
pause(0.1);					% ����ʵ���з��������ͣ�٣����ڿ����������仯������ȡ�Ĵ��ڴ�С����ԭ���ĳߴ硣���˸�����Ҫ���Խ���ʵ����֤
warning('on','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');		% ����ؾ�������

xlabel('X');
ylabel('Y');
ylabel('Q');

TT = 100; % ֡��
t0 = T(end)/TT; % ���

xc = zeros(Nx,Ny1);
y = zeros(Nx,Ny1);

for j = 1:Ny1
    xc(:,j) = Xc;
end

for i = 1:Nx
    y(i,:) = Y';
end

for i = 1:TT + 1
    tt = (i - 1)*t0;
    [~,j] = min(abs(T - tt));
    p = pcolor(xc,y,uflash(:,:,j)); colormap(jet); p.EdgeColor = 'none';
%    mesh(xc,y,uflash(:,:,j)); colormap(jet);axis([Xc(1),Xc(end),Y(1),Y(end),min(min(min(uflash(:,:,1)))) - 0.1,max(max(max(uflash(:,:,1)))) + 0.1]);
   pause(0.001);
end