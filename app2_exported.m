classdef app2_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        BeefozLabel                    matlab.ui.control.Label
        BeefozSlider                   matlab.ui.control.Slider
        ChickenozSliderLabel           matlab.ui.control.Label
        ChickenozSlider                matlab.ui.control.Slider
        PorkozSliderLabel              matlab.ui.control.Label
        PorkozSlider                   matlab.ui.control.Slider
        WeightEditFieldLabel           matlab.ui.control.Label
        WeightEditField                matlab.ui.control.NumericEditField
        BeansozSliderLabel             matlab.ui.control.Label
        BeansozSlider                  matlab.ui.control.Slider
        TofuozSliderLabel              matlab.ui.control.Label
        TofuozSlider                   matlab.ui.control.Slider
        EggsSliderLabel                matlab.ui.control.Label
        EggsSlider                     matlab.ui.control.Slider
        CheeseozSliderLabel            matlab.ui.control.Label
        CheeseozSlider                 matlab.ui.control.Slider
        PlotButton                     matlab.ui.control.Button
        kgCO2equivLabel                matlab.ui.control.Label
        UIAxes2                        matlab.ui.control.UIAxes
        UIAxes3                        matlab.ui.control.UIAxes
        ReqWeeklyProteinTextAreaLabel  matlab.ui.control.Label
        ReqWeeklyProteinTextArea       matlab.ui.control.TextArea
        gProteinbySourceLabel          matlab.ui.control.Label
    end

    
       

    methods (Access = private)

        % Value changed function: BeefozSlider
        function BeefozSliderValueChanged(app, event)
           % beefoz = app.BeefozSlider.Value;
            %CO2Ebeef = beefoz/35.274*52*26.45; 
        end

        % Value changed function: ChickenozSlider
        function ChickenozSliderValueChanged(app, event)
           % chickenoz = app.ChickenozSlider.Value;
           % CO2Echicken = chickenoz /35.274*52 * 5.05;
        end

        % Value changed function: WeightEditField
        function WeightEditFieldValueChanged(app, event)
           % weight = app.WeightEditField.Value;
           % proteinreq = weight * .36;
           % value = app.RequiredWeeklyProteinEditField.Value;
        end

        % Value changed function: PorkozSlider
        function PorkozSliderValueChanged(app, event)
           % porkoz = app.PorkozSlider.Value;
           % CO2Epork = porkoz /35.274*52* 6.87;
        end

        % Value changed function: EggsSlider
        function EggsSliderValueChanged(app, event)
            %eggs = app.EggsSlider.Value;
            %CO2Eegg = eggs *2.125/35.274*52* 3.54;
        end

        % Value changed function: CheeseozSlider
        function CheeseozSliderValueChanged(app, event)
           % cheeseoz = app.CheeseozSlider.Value;
           % CO2Echeese = cheeseoz /35.274*52* 9.78;
        end

        % Value changed function: BeansozSlider
        function BeansozSliderValueChanged(app, event)
           % beansoz = app.BeansozSlider.Value;
           % CO2Ebeans = beansoz /35.274*52* .78;
        end

        % Value changed function: TofuozSlider
        function TofuozSliderValueChanged(app, event)
            %tofuoz = app.TofuozSlider.Value;
            %CO2Etofu = tofuoz /35.274*52* .982;          
        end

        % Button pushed function: PlotButton
        function PlotButtonPushed(app, event)
            
            beefoz = app.BeefozSlider.Value;
            CO2Ebeef = beefoz / 35.274 * 52 * 26.45;  
            gpbeef = beefoz / 3.52 * 30;
            
            chickenoz = app.ChickenozSlider.Value;
            CO2Echicken = chickenoz / 35.274 * 52 * 5.05;
            gpchick = chickenoz / 3.52 * 27;
            
            porkoz = app.PorkozSlider.Value;
            CO2Epork = porkoz /35.274*52* 6.87;
            gppork = porkoz / 3.52 * 26.86;
            
            eggs = app.EggsSlider.Value;
            CO2Eegg = eggs *2.125/35.274*52* 3.54;
            gpegg = eggs  * 6;
            
            cheeseoz = app.CheeseozSlider.Value;
            CO2Echeese = cheeseoz /35.274*52* 9.78;
            gpcheese = cheeseoz / 3.52 * 27;
            
            beansoz = app.BeansozSlider.Value;
            CO2Ebeans = beansoz /35.274*52* .78;
            gpbeans = beansoz / 3.52 * 9;
            
            tofuoz = app.TofuozSlider.Value;
            CO2Etofu = tofuoz /35.274*52* .982; 
            gptofu = tofuoz / 3.52 * 10.9;
            
            
            cla(app.UIAxes2);
            Y = [gpbeef; gpchick; gppork; gpegg; gpcheese; gpbeans; gptofu];
           
            labels = {num2str(gpbeef), num2str(gpchick), num2str(gppork), num2str(gpegg), num2str(gpcheese), num2str(gpbeans), num2str(gptofu)}
             pie(app.UIAxes2, Y ,labels)
            legend(app.UIAxes2, 'Beef', 'Chicken', 'Pork', 'Egg', 'Cheese', 'Beans', 'Tofu', 'Location', 'southoutside')
            display(sum(Y));
            
            
            cla(app.UIAxes3);
            X = [CO2Ebeef; CO2Echicken; CO2Epork; CO2Eegg; CO2Echeese; CO2Ebeans; CO2Etofu];
            pie(app.UIAxes3, X )
            legend(app.UIAxes3, 'Beef', 'Chicken', 'Pork', 'Egg', 'Cheese', 'Beans', 'Tofu', 'Location', 'southoutside')
        end

        % Callback function
        function RequiredWeeklyProteinEditFieldValueChanged(app, event)

            app.RequiredWeeklyProteinEditField.Value = app.WeightEditField.Value * .36 * 7;
        end

        % Value changed function: ReqWeeklyProteinTextArea
        function ReqWeeklyProteinTextAreaValueChanged(app, event)
           app.ReqWeeklyProteinTextArea.Value = num2str(app.WeightEditField.Value * .36 * 7);
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 1010 492];
            app.UIFigure.Name = 'UI Figure';

            % Create BeefozLabel
            app.BeefozLabel = uilabel(app.UIFigure);
            app.BeefozLabel.HorizontalAlignment = 'right';
            app.BeefozLabel.Position = [54 369 51 22];
            app.BeefozLabel.Text = 'Beef(oz)';

            % Create BeefozSlider
            app.BeefozSlider = uislider(app.UIFigure);
            app.BeefozSlider.Limits = [0.1 40];
            app.BeefozSlider.MajorTicks = [0.1 8 16 24 32 40];
            app.BeefozSlider.ValueChangedFcn = createCallbackFcn(app, @BeefozSliderValueChanged, true);
            app.BeefozSlider.Position = [126 378 150 3];
            app.BeefozSlider.Value = 13.37;

            % Create ChickenozSliderLabel
            app.ChickenozSliderLabel = uilabel(app.UIFigure);
            app.ChickenozSliderLabel.HorizontalAlignment = 'right';
            app.ChickenozSliderLabel.Position = [35 315 70 22];
            app.ChickenozSliderLabel.Text = 'Chicken(oz)';

            % Create ChickenozSlider
            app.ChickenozSlider = uislider(app.UIFigure);
            app.ChickenozSlider.Limits = [0.1 40];
            app.ChickenozSlider.MajorTicks = [0.1 8 16 24 32 40];
            app.ChickenozSlider.ValueChangedFcn = createCallbackFcn(app, @ChickenozSliderValueChanged, true);
            app.ChickenozSlider.Position = [126 324 150 3];
            app.ChickenozSlider.Value = 16.78;

            % Create PorkozSliderLabel
            app.PorkozSliderLabel = uilabel(app.UIFigure);
            app.PorkozSliderLabel.HorizontalAlignment = 'right';
            app.PorkozSliderLabel.Position = [54 261 51 22];
            app.PorkozSliderLabel.Text = 'Pork(oz)';

            % Create PorkozSlider
            app.PorkozSlider = uislider(app.UIFigure);
            app.PorkozSlider.Limits = [0.1 40];
            app.PorkozSlider.MajorTicks = [0.1 8 16 24 32 40];
            app.PorkozSlider.ValueChangedFcn = createCallbackFcn(app, @PorkozSliderValueChanged, true);
            app.PorkozSlider.Position = [126 270 150 3];
            app.PorkozSlider.Value = 9.25;

            % Create WeightEditFieldLabel
            app.WeightEditFieldLabel = uilabel(app.UIFigure);
            app.WeightEditFieldLabel.HorizontalAlignment = 'right';
            app.WeightEditFieldLabel.Position = [21 451 42 22];
            app.WeightEditFieldLabel.Text = 'Weight';

            % Create WeightEditField
            app.WeightEditField = uieditfield(app.UIFigure, 'numeric');
            app.WeightEditField.Limits = [75 1000];
            app.WeightEditField.ValueChangedFcn = createCallbackFcn(app, @WeightEditFieldValueChanged, true);
            app.WeightEditField.Enable = 'off';
            app.WeightEditField.Position = [78 451 100 22];
            app.WeightEditField.Value = 200;

            % Create BeansozSliderLabel
            app.BeansozSliderLabel = uilabel(app.UIFigure);
            app.BeansozSliderLabel.HorizontalAlignment = 'right';
            app.BeansozSliderLabel.Position = [45 102 60 22];
            app.BeansozSliderLabel.Text = 'Beans(oz)';

            % Create BeansozSlider
            app.BeansozSlider = uislider(app.UIFigure);
            app.BeansozSlider.Limits = [0.1 30];
            app.BeansozSlider.MajorTicks = [0.1 5 10 15 20 25 30];
            app.BeansozSlider.ValueChangedFcn = createCallbackFcn(app, @BeansozSliderValueChanged, true);
            app.BeansozSlider.Position = [126 111 150 3];
            app.BeansozSlider.Value = 2.31;

            % Create TofuozSliderLabel
            app.TofuozSliderLabel = uilabel(app.UIFigure);
            app.TofuozSliderLabel.HorizontalAlignment = 'right';
            app.TofuozSliderLabel.Position = [56 49 49 22];
            app.TofuozSliderLabel.Text = 'Tofu(oz)';

            % Create TofuozSlider
            app.TofuozSlider = uislider(app.UIFigure);
            app.TofuozSlider.Limits = [0.1 30];
            app.TofuozSlider.MajorTicks = [0.1 5 10 15 20 25 30];
            app.TofuozSlider.ValueChangedFcn = createCallbackFcn(app, @TofuozSliderValueChanged, true);
            app.TofuozSlider.Position = [126 58 150 3];
            app.TofuozSlider.Value = 0.1;

            % Create EggsSliderLabel
            app.EggsSliderLabel = uilabel(app.UIFigure);
            app.EggsSliderLabel.HorizontalAlignment = 'right';
            app.EggsSliderLabel.Position = [52 208 43 22];
            app.EggsSliderLabel.Text = 'Eggs #';

            % Create EggsSlider
            app.EggsSlider = uislider(app.UIFigure);
            app.EggsSlider.Limits = [0.1 24];
            app.EggsSlider.MajorTicks = [0.1 4 8 12 16 20 24];
            app.EggsSlider.ValueChangedFcn = createCallbackFcn(app, @EggsSliderValueChanged, true);
            app.EggsSlider.Position = [126 217 150 3];
            app.EggsSlider.Value = 2.71;

            % Create CheeseozSliderLabel
            app.CheeseozSliderLabel = uilabel(app.UIFigure);
            app.CheeseozSliderLabel.HorizontalAlignment = 'right';
            app.CheeseozSliderLabel.Position = [37 155 68 22];
            app.CheeseozSliderLabel.Text = 'Cheese(oz)';

            % Create CheeseozSlider
            app.CheeseozSlider = uislider(app.UIFigure);
            app.CheeseozSlider.Limits = [0.1 20];
            app.CheeseozSlider.MajorTicks = [0.1 4 8 12 16 20];
            app.CheeseozSlider.ValueChangedFcn = createCallbackFcn(app, @CheeseozSliderValueChanged, true);
            app.CheeseozSlider.Position = [126 164 150 3];
            app.CheeseozSlider.Value = 7;

            % Create PlotButton
            app.PlotButton = uibutton(app.UIFigure, 'push');
            app.PlotButton.ButtonPushedFcn = createCallbackFcn(app, @PlotButtonPushed, true);
            app.PlotButton.Position = [401 80 100 22];
            app.PlotButton.Text = 'Plot ';

            % Create kgCO2equivLabel
            app.kgCO2equivLabel = uilabel(app.UIFigure);
            app.kgCO2equivLabel.FontWeight = 'bold';
            app.kgCO2equivLabel.Position = [449 451 82 22];
            app.kgCO2equivLabel.Text = 'kg CO2 equiv';

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.UIFigure);
            title(app.UIAxes2, '')
            xlabel(app.UIAxes2, 'X')
            ylabel(app.UIAxes2, 'Y')
            app.UIAxes2.Position = [677 101 300 338];

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.UIFigure);
            title(app.UIAxes3, '')
            xlabel(app.UIAxes3, 'X')
            ylabel(app.UIAxes3, 'Y')
            app.UIAxes3.Position = [331 113 300 314];

            % Create gProteinbySourceLabel
            app.gProteinbySourceLabel = uilabel(app.UIFigure);
            app.gProteinbySourceLabel.FontWeight = 'bold';
            app.gProteinbySourceLabel.Position = [786 463 122 22];
            app.gProteinbySourceLabel.Text = 'g Protein by Source ';

            % Create ReqWeeklyProteinTextAreaLabel
            app.ReqWeeklyProteinTextAreaLabel = uilabel(app.UIFigure);
            app.ReqWeeklyProteinTextAreaLabel.HorizontalAlignment = 'right';
            app.ReqWeeklyProteinTextAreaLabel.Enable = 'off';
            app.ReqWeeklyProteinTextAreaLabel.Position = [15 426 111 22];
            app.ReqWeeklyProteinTextAreaLabel.Text = 'Req Weekly Protein';

            % Create ReqWeeklyProteinTextArea
            app.ReqWeeklyProteinTextArea = uitextarea(app.UIFigure);
            app.ReqWeeklyProteinTextArea.ValueChangedFcn = createCallbackFcn(app, @ReqWeeklyProteinTextAreaValueChanged, true);
            app.ReqWeeklyProteinTextArea.Editable = 'off';
            app.ReqWeeklyProteinTextArea.Enable = 'off';
            app.ReqWeeklyProteinTextArea.Position = [134 426 44 22];
            app.ReqWeeklyProteinTextArea.Value = {'504'};
        end
    end

    methods (Access = public)

        % Construct app
        function app = app2_exported

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end