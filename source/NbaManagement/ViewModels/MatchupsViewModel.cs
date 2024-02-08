using NbaManagement.Mvvm.Navigation;
using NbaManagement.Services;
using NbaManagement.ViewModels.Base;

namespace NbaManagement.ViewModels
{
    public class MatchupsViewModel : NavigatableTitledViewModel
    {
        public MatchupsViewModel(INavigationService navigationService, MatchupService matchupService) : base(navigationService)
        {
            Title = "Matchup List";
        }
    }
}