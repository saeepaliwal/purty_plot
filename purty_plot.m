function purty_plot(figNum)

%{
defaults.nIter = 30000;
defaults.jobId = 1;
defaults.dirOut = pwd;
defaults.burnIn = 0;
args = propval(varargin, defaults);

%}
%hFig, hAxes, hPlot,hLabel,hTitle,hLegend)

hFig = figNum;

% Get axes:
hAxes = get(hFig,'CurrentAxes');

% Get data axes
hData = get(hAxes,'Children');
hTitle = get(hAxes,'Title');
hLegend =  findobj(hFig,'Type','axes','Tag','legend')
hLabel = findobj(hFig,'Type','Text');
keyboard
% Adjust fonts of the axis
for l = 1:length(hAxes)
	set(hAxes(l),  ...
		'FontName','Helvetica' );
end
% Adjust the line smoothing
%if ~isempty(hPlot)
%	for k = 1:length(hPlot)
%		set(hPlot(k), ...
%			'LineSmoothing', 'on');
%	end
% end

% Adjust fonts of the labels
if ~isempty(hLabel)
	for i = 1:length(hLabel)
		set(hLabel(i), ...
			'FontName'   , 'Helvetica',...
			'FontSize'   , 15          );
	end
end

% Make title purty:
for j = 1:length(hTitle)
	set(hTitle(j)                    , ...
		'FontName'   , 'Helvetica', ...
		'FontSize'   , 15          , ...
		'FontWeight' , 'bold'      );
end

% Make legend purty:
set([hLegend]          ,...
    'FontSize'   , 12         , ...
	'location', 'SouthWest'  );

% Set axes properties
set(hAxes, ...
  'Box'         , 'off'     , ...
  'FontSize'    , 12         , ...
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

export_fig('purtyplot.pdf','-transparent',hFig);

% Color pallettes:

% deep carrot orange, fern green,
% glaucous, 
% deep coffee