function purty_plot(figNum, figurename)
% Use purty_plot(figureNumber, desiredFigureName)
fontName = 'Helvetica';

hFig = figNum;

% Get axes:
hAxes = get(hFig,'Children');
hPlot = [];

% Get data axes
hData = get(hAxes,'Children');
hTitle = get(hAxes,'Title');
hLegend =  findobj(hFig,'Type','axes','Tag','legend');
hLabel = [get(hAxes,'xlabel') get(hAxes,'ylabel')];


% Adjust fonts of the axis
for l = 1:length(hAxes)
    if iscell(hAxes)
        axis = hAxes{l};
    else
        axis = hAxes(l);
    end
    
	set(axis,  ...
        'FontName',fontName , ...
        'FontSize', 14, ...
        'Box'         , 'off'     , ...
        'GridLineStyle' , 'none'     , ...
        'TickDir'     , 'out'     , ...
        'TickLength'  , [.02 .02] , ...
        'XMinorTick'  , 'on'      , ...
        'YMinorTick'  , 'on'      , ...
        'YGrid'       , 'on'      , ...
        'XColor'      , [.3 .3 .3], ...
        'YColor'      , [.3 .3 .3], ...
        'LineWidth'   , 1         );
    grid off
end

% Adjust the line smoothing
if ~isempty(hPlot)
    if iscell(hPlot)
        plot = hPlot{k};
    else 
        plot = hPlot(k);
    end
    for k = 1:length(hPlot)
        set(plot, ...
            'LineSmoothing', 'on',...
            'LineWidth',2);
    end
end

% Adjust fonts of the labels
if ~isempty(hLabel)
    for i = 1:length(hLabel)
        if iscell(hLabel)
            label = hLabel{i};
        else
            label = hLabel(i);
        end
        set(label, ...
			'FontName'   , fontName ,...
			'FontSize'   , 14          );
	end
end

% Make title purty:
for j = 1:length(hTitle)
    if iscell(hTitle)
        title = hTitle{j};
    else
        title = hTitle(j);
    end
	set(title                    , ...
		'FontName'   , fontName, ...
		'FontSize'   , 14          , ...
		'FontWeight' , 'bold'      );
end

% Make legend purty:
set([hLegend]                , ...
    'FontSize'   , 10       , ...
    'FontName'   , fontName  , ...
	'location', 'SouthWest'  );

set(gcf, 'PaperPositionMode', 'auto');

%figurename_eps = [ figurename '.eps'];
%figurename_pdf =  [ figurename '.pdf'];
figurename_png = [figurename '.png'];
print(figurename_png,'-dpng')
%eps2pdf(figurename_eps, figurename_pdf)

