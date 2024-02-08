using System.ComponentModel.Design;
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
            serviceContainer.AddService(typeof(DatabaseContext), new DatabaseContext());
            
            // Registering services that depend on database
            serviceContainer.AddService(typeof(TeamService), (sc, _) =>
                new TeamService(sc.GetRequiredService<DatabaseContext>()));
            
            serviceContainer.AddService(typeof(PlayerService), (sc, _) =>
                new PlayerService(sc.GetRequiredService<DatabaseContext>()));
            
            serviceContainer.AddService(typeof(MatchupService), (sc, _) =>
                new MatchupService(sc.GetRequiredService<DatabaseContext>()));

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
            
            serviceContainer.AddService(typeof(PlayersViewModel), (sc, _) =>
                new PlayersViewModel(sc.GetRequiredService<INavigationService>(), sc.GetRequiredService<PlayerService>()));
            
            serviceContainer.AddService(typeof(MatchupsViewModel), (sc, _) =>
                new MatchupsViewModel(sc.GetRequiredService<INavigationService>(), sc.GetRequiredService<MatchupService>()));
            
            serviceContainer.AddService(typeof(PhotosViewModel), new PhotosViewModel());

            new MainWindow().Show();
            navigationService.Navigate(typeof(MainViewModel));
        }
    }
}