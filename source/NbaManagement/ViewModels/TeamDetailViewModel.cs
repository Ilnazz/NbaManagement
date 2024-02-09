using NbaManagement.Database;
using NbaManagement.Enums;
using NbaManagement.Mvvm.Input;
using NbaManagement.ViewModels.Base;
using System.Linq;

namespace NbaManagement.ViewModels
{
    public class TeamDetailViewModel : TitledViewModel
    {
        #region Properties
        public int ShownTeamDetailIndex { get; }

        public Team Team { get; }

        public PlayerPositionViewModel PowerForwardPositionViewModel { get; }

        public PlayerPositionViewModel ShootingGuardPositionViewModel { get; }

        public PlayerPositionViewModel CenterPositionViewModel { get; }

        public PlayerPositionViewModel SmallForwardPositionViewModel { get; }

        public PlayerPositionViewModel PointGuardPositionViewModel { get; }
        #endregion

        public IRelayCommand SearchCommand { get; }

        public TeamDetailViewModel(Team team, TeamDetail? shownTeamDetail = null)
        {
            Team = team;
            ShownTeamDetailIndex = shownTeamDetail.HasValue ? (int)shownTeamDetail.Value : -1;
            
            Title = "Team Detail";

            PowerForwardPositionViewModel = new PlayerPositionViewModel("PF", Team.Player.Where(p => p.IsPowerForward));
            ShootingGuardPositionViewModel = new PlayerPositionViewModel("SG", Team.Player.Where(p => p.IsShootingGuard));
            CenterPositionViewModel = new PlayerPositionViewModel("CP", Team.Player.Where(p => p.IsCenter));
            SmallForwardPositionViewModel = new PlayerPositionViewModel("SF", Team.Player.Where(p => p.IsSmallForward));
            PointGuardPositionViewModel = new PlayerPositionViewModel("PG", Team.Player.Where(p => p.IsPointGuard));

            SearchCommand = new RelayCommand(() =>
            {

            });
        }
    }
}