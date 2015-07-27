function purty_plot(figNum, figurename)
fontName = 'Open Sans Condensed';

hFig = figNum;

% Get axes:
hAxes = get(hFig,'CurrentAxes');
hPlot = [];

% Get data axes
hData = get(hAxes,'Children');
hTitle = get(hAxes,'Title');
hLegend =  findobj(hFig,'Type','axes','Tag','legend')
hLabel = [get(hAxes,'xlabel') get(hAxes,'ylabel')];

% Adjust fonts of the axis
for l = 1:length(hAxes)
	set(hAxes(l),  ...
		'FontName',fontName );
end

% Adjust the line smoothing
if ~isempty(hPlot)
    for k = 1:length(hPlot)
        set(hPlot(k), ...
            'LineSmoothing', 'on',...
            'LineWidth',2);
    end
end

% Adjust fonts of the labels
if ~isempty(hLabel)
	for i = 1:length(hLabel)
		set(hLabel(i), ...
			'FontName'   , fontName ,...
			'FontSize'   , 15          );
	end
end

% Make title purty:
for j = 1:length(hTitle)
	set(hTitle(j)                    , ...
		'FontName'   , fontName, ...
		'FontSize'   , 18          , ...
		'FontWeight' , 'bold'      );
end

% Make legend purty:
set([hLegend]                , ...
    'FontSize'   , 10       , ...
    'FontName'   , fontName  , ...
	'location', 'SouthWest'  );

% Set axes properties
set(hAxes, ...
  'Box'         , 'off'     , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'on'      , ...
  'XColor'      , [.3 .3 .3], ...
  'YColor'      , [.3 .3 .3], ...
  'LineWidth'   , 1         );
box off
set(gcf, 'PaperPositionMode', 'auto');
grid off

figurename = [ figurename '.pdf'];
export_fig(figurename,'-transparent',hFig);

