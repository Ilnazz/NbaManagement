﻿using System.ComponentModel.Design;
using System.Data.Entity;
using System.Windows;
using NbaManagement.Database;
using NbaManagement.Mvvm.DependencyInjection;
using NbaManagement.Mvvm.Navigation;
using NbaManagement.Services;
using NbaManagement.ViewModels;

namespace NbaManagement.Startup
{
    public partial class App
    {
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            var serviceContainer = new ServiceContainer();
            Ioc.Default.ConfigureServices(serviceContainer);

            // Registering database
            var databaseContext = new DatabaseContext();

            // Caching database entities
            databaseContext.Team.Load();
            databaseContext.Player.Load();
            databaseContext.Gender.Load();
            databaseContext.Seasons.Load();
            databaseContext.Country.Load();
            databaseContext.Colleges.Load();
            databaseContext.Matchups.Load();
            databaseContext.Locations.Load();
            databaseContext.Divisions.Load();
            databaseContext.Conferences.Load();
            databaseContext.MatchupTypes.Load();
            databaseContext.MatchupStatus.Load();
            databaseContext.PlayerPosition.Load();

            serviceContainer.AddService(typeof(DatabaseContext), databaseContext);
            
            // Registering services that depend on database
            serviceContainer.AddService(typeof(TeamService), (sc, _) =>
                new TeamService(sc.GetRequiredService<DatabaseContext>()));
            
            // Registering navigation service
            var navigationService = new NavigationService(serviceContainer);
            serviceContainer.AddService(typeof(INavigationService), navigationService);
            
            // Registering view models
            serviceContainer.AddService(typeof(NavigationViewModel), (sc, _) =>
                new NavigationViewModel(sc.GetRequiredService<INavigationService>()));
            
            serviceContainer.AddService(typeof(StatusBarViewModel), new StatusBarViewModel());
            
            serviceContainer.AddService(typeof(MainViewModel), (sc, _) =>
                new MainViewModel(sc.GetRequiredService<INavigationService>()));
            
            serviceContainer.AddService(typeof(VisitorViewModel), (sc, _) =>
                new VisitorViewModel(sc.GetRequiredService<INavigationService>()));
            
            serviceContainer.AddService(typeof(TeamsViewModel), (sc, _) =>
                new TeamsViewModel(sc.GetRequiredService<INavigationService>(), sc.GetRequiredService<TeamService>()));
            
            // Creating and showing window
            new MainWindow().Show();

            // Navigating to initial view model
            navigationService.Navigate(typeof(MainViewModel));
        }
    }
}