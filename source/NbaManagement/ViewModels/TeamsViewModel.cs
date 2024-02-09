using NbaManagement.Mvvm.Navigation;
using NbaManagement.Services;
using NbaManagement.ViewModels.Base;
using NbaManagement.Database;
using NbaManagement.Mvvm.Input;

namespace NbaManagement.ViewModels
{
    public class TeamsViewModel : TitledViewModel
    {
        public IRelayCommand<Team> NavigateToTeamDetailCommand { get; }

        public TeamsViewModel(INavigationService navigationService, TeamService teamService)
        {
            Title = "Teams Main";

            NavigateToTeamDetailCommand = new RelayCommand<Team>(team =>
                navigationService.Navigate(new TeamDetailViewModel(team)));
        }
    }
}