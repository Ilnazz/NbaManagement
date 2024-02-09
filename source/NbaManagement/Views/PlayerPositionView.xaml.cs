using NbaManagement.Database;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;

namespace NbaManagement.Views
{
    public partial class PlayerPositionView : UserControl
    {
        public static readonly DependencyProperty PositionNameProperty =
            DependencyProperty.Register(nameof(PositionName), typeof(string), typeof(PlayerPositionView));
        
        public string PositionName
        {
            get { return (string)GetValue(PositionNameProperty); }
            set { SetValue(PositionNameProperty, value); }
        }

        public IEnumerable<Player> Players
        {
            get { return (IEnumerable<Player>)GetValue(PlayersProperty); }
            set { SetValue(PlayersProperty, value); }
        }

        public static readonly DependencyProperty PlayersProperty =
            DependencyProperty.Register(nameof(Players), typeof(IEnumerable<Player>), typeof(PlayerPositionView));

        public PlayerPositionView() => InitializeComponent();
    }
}