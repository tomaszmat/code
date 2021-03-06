using System;
using System.Drawing;

namespace ZedGraph
{
	/// <summary>
	/// This class handles the drawing of the curve <see cref="Symbol"/> objects.
	/// The symbols are the small shapes that appear over each defined point
	/// along the curve.
	/// </summary>
	public class Symbol : ICloneable
	{
		private float		size;
		private SymbolType	type;
		private float		penWidth;
		private Color		color;
		private bool		isVisible;
		private bool		isFilled;

		/// <summary>
		/// Default constructor that sets all <see cref="Symbol"/> properties to default
		/// values as defined in the <see cref="Def"/> class.
		/// </summary>
		public Symbol()
		{
			Init();
		}

		/// <summary>
		/// The Copy Constructor
		/// </summary>
		/// <param name="rhs">The Symbol object from which to copy</param>
		public Symbol( Symbol rhs )
		{
			size = rhs.Size;
			type = rhs.Type;
			penWidth = rhs.PenWidth;
			color = rhs.Color;
			isVisible = rhs.IsVisible;
			isFilled = rhs.IsFilled;
		}

		/// <summary>
		/// Deep-copy clone routine
		/// </summary>
		/// <returns>A new, independent copy of the Symbol/returns>
		public object Clone()
		{ 
			return new Symbol( this ); 
		}

		/// <summary>
		/// Initialize all <see cref="Symbol"/> properties to  default
		/// values as defined in the <see cref="Def"/> class.
		/// </summary>
		protected void Init()
		{
			this.size = Def.Sym.Size;
			this.type = Def.Sym.Type;
			this.penWidth = Def.Sym.PenWidth;
			this.color = Def.Sym.Color;
			this.isVisible = Def.Sym.IsVisible;
			this.isFilled = Def.Sym.IsFilled;
		}

		/// <summary>
		/// Gets or sets the size of the <see cref="Symbol"/>
		/// </summary>
		/// <value>Size in pixels</value>
		public float Size
		{
			get { return size; }
			set { size = value; }
		}
		/// <summary>
		/// Gets or sets the type (shape) of the <see cref="Symbol"/>
		/// </summary>
		/// <value>A <see cref="SymbolType"/> enum value indicating the shape</value>
		public SymbolType Type
		{
			get { return type; }
			set { type = value; }
		}
		/// <summary>
		/// Set to true to fill in the <see cref="Symbol"/> with color, or false for
		/// a simple outline symbol.  Note that some symbols, such as
		/// <see cref="SymbolType.Plus"/> and <see cref="SymbolType.Star"/>
		/// cannot be filled in since they are not a closed shape.
		/// </summary>
		public bool IsFilled
		{
			get { return isFilled; }
			set { isFilled = value;}
		}
		/// <summary>
		/// Gets or sets a property that shows or hides the <see cref="Symbol"/>.
		/// </summary>
		/// <value>true to show the symbol, false to hide it</value>
		public bool IsVisible
		{
			get { return isVisible; }
			set { isVisible = value; }
		}
		/// <summary>
		/// Gets or sets the pen width used to draw the <see cref="Symbol"/> outline
		/// </summary>
		/// <value>Pen width in pixel units</value>
		public float PenWidth
		{
			get { return penWidth; }
			set { penWidth = value; }
		}
		/// <summary>
		/// The color of the <see cref="Symbol"/>
		/// </summary>
		public Color Color
		{
			get { return color; }
			set { color = value; }
		}

		/// <summary>
		/// Draw the <see cref="Symbol"/> to the specified <see cref="Graphics"/> device
		/// at the specified location.  This routine draws a single symbol.
		/// </summary>
		/// <param name="g">
		/// A graphic device object to be drawn into.  This is normally e.Graphics from the
		/// PaintEventArgs argument to the Paint() method.
		/// </param>
		/// <param name="x">The x position of the center of the symbol in
		/// screen pixel units</param>
		/// <param name="y">The y position of the center of the symbol in
		/// screen pixel units</param>
		/// <param name="scaleFactor">
		/// The scaling factor for the features of the graph based on the <see cref="GraphPane.BaseDimension"/>.  This
		/// scaling factor is calculated by the <see cref="GraphPane.CalcScaleFactor"/> method.  The scale factor
		/// represents a linear multiple to be applied to font sizes, symbol sizes, etc.
		/// </param>		
		public void Draw( Graphics g, float x, float y, double scaleFactor )
		{
			// Only draw if the symbol is visible
			if ( this.isVisible )
			{
				// Fill or draw the symbol as required
				if ( this.isFilled )
					FillPoint( g, x, y, scaleFactor );
				else
					DrawPoint( g, x, y, scaleFactor );
			}
		}

		/// <summary>
		/// Draw the <see cref="Symbol"/> (outline only) to the specified <see cref="Graphics"/>
		/// device at the specified location.
		/// </summary>
		/// <param name="g">
		/// A graphic device object to be drawn into.  This is normally e.Graphics from the
		/// PaintEventArgs argument to the Paint() method.
		/// </param>
		/// <param name="x">The x position of the center of the symbol in
		/// screen pixel units</param>
		/// <param name="y">The y position of the center of the symbol in
		/// screen pixel units</param>
		/// <param name="scaleFactor">
		/// The scaling factor for the features of the graph based on the <see cref="GraphPane.BaseDimension"/>.  This
		/// scaling factor is calculated by the <see cref="GraphPane.CalcScaleFactor"/> method.  The scale factor
		/// represents a linear multiple to be applied to font sizes, symbol sizes, etc.
		/// </param>		
		public void DrawPoint( Graphics g, float x, float y, double scaleFactor )
		{
			float	scaledSize = (float) ( this.size * scaleFactor );
			float	hsize = scaledSize / 2,
					hsize1 = hsize + 1;

			Pen pen = new Pen( this.color, this.penWidth );

			switch( this.type )
			{
				case SymbolType.Square:
					g.DrawLine( pen, x-hsize, y-hsize, x+hsize, y-hsize );
					g.DrawLine( pen, x+hsize, y-hsize, x+hsize, y+hsize );
					g.DrawLine( pen, x+hsize, y+hsize, x-hsize, y+hsize );
					g.DrawLine( pen, x-hsize, y+hsize, x-hsize, y-hsize );
					break;
				case SymbolType.Diamond:
					g.DrawLine( pen, x, y-hsize, x+hsize, y );
					g.DrawLine( pen, x+hsize, y, x, y+hsize );
					g.DrawLine( pen, x, y+hsize, x-hsize, y );
					g.DrawLine( pen, x-hsize, y, x, y-hsize );
					break;
				case SymbolType.Triangle:
					g.DrawLine( pen, x, y-hsize, x+hsize, y+hsize );
					g.DrawLine( pen, x+hsize, y+hsize, x-hsize, y+hsize );
					g.DrawLine( pen, x-hsize, y+hsize, x, y-hsize );
					break;
				case SymbolType.Circle:
					g.DrawEllipse( pen, x-hsize, y-hsize, scaledSize, scaledSize );
					break;
				case SymbolType.XCross:
					g.DrawLine( pen, x-hsize, y-hsize, x+hsize1, y+hsize1 );
					g.DrawLine( pen, x+hsize, y-hsize, x-hsize1, y+hsize1 );
					break;
				case SymbolType.Plus:
					g.DrawLine( pen, x, y-hsize, x, y+hsize1 );
					g.DrawLine( pen, x-hsize, y, x+hsize1, y );
					break;
				case SymbolType.Star:
					g.DrawLine( pen, x, y-hsize, x, y+hsize1 );
					g.DrawLine( pen, x-hsize, y, x+hsize1, y );
					g.DrawLine( pen, x-hsize, y-hsize, x+hsize1, y+hsize1 );
					g.DrawLine( pen, x+hsize, y-hsize, x-hsize1, y+hsize1 );
					break;
				case SymbolType.TriangleDown:
					g.DrawLine( pen, x, y+hsize, x+hsize, y-hsize );
					g.DrawLine( pen, x+hsize, y-hsize, x-hsize, y-hsize );
					g.DrawLine( pen, x-hsize, y-hsize, x, y+hsize );
					break;
			}
		}

		/// <summary>
		/// Render the filled <see cref="Symbol"/> to the specified <see cref="Graphics"/>
		/// device at the specified location.
		/// </summary>
		/// <param name="g">
		/// A graphic device object to be drawn into.  This is normally e.Graphics from the
		/// PaintEventArgs argument to the Paint() method.
		/// </param>
		/// <param name="x">The x position of the center of the symbol in
		/// screen pixel units</param>
		/// <param name="y">The y position of the center of the symbol in
		/// screen pixel units</param>
		/// <param name="scaleFactor">
		/// The scaling factor for the features of the graph based on the <see cref="GraphPane.BaseDimension"/>.  This
		/// scaling factor is calculated by the <see cref="GraphPane.CalcScaleFactor"/> method.  The scale factor
		/// represents a linear multiple to be applied to font sizes, symbol sizes, etc.
		/// </param>		
		public void FillPoint( Graphics g, float x, float y, double scaleFactor )
		{
			float	scaledSize = (float) ( this.size * scaleFactor ),
					hsize = scaledSize / 2,
					hsize4 = scaledSize / 3,
					hsize41 = hsize4 + 1,
					hsize1 = hsize + 1;

			PointF[]	polyPt = new PointF[5];
			SolidBrush	brush = new SolidBrush( this.color );
			Pen pen = new Pen( this.color, this.penWidth );
			
			switch( this.type )
			{
				case SymbolType.Square:
					g.FillRectangle( brush, x-hsize, y-hsize, scaledSize, scaledSize );
					break;
				case SymbolType.Diamond:
					polyPt[0].X = x;
					polyPt[0].Y = y-hsize;
					polyPt[1].X = x+hsize;
					polyPt[1].Y = y;
					polyPt[2].X = x;
					polyPt[2].Y = y+hsize;
					polyPt[3].X = x-hsize;
					polyPt[3].Y = y;
					polyPt[4] = polyPt[0];
					g.FillPolygon( brush, polyPt );
					break;
				case SymbolType.Triangle:
					polyPt[0].X = x;
					polyPt[0].Y = y-hsize;
					polyPt[1].X = x+hsize;
					polyPt[1].Y = y+hsize;
					polyPt[2].X = x-hsize;
					polyPt[2].Y = y+hsize;
					polyPt[3] = polyPt[0];
					g.FillPolygon( brush, polyPt );
					break;
				case SymbolType.Circle:
					g.FillEllipse( brush, x-hsize, y-hsize, scaledSize, scaledSize );
					break;
				case SymbolType.XCross:
					g.FillRectangle( brush, x-hsize4, y-hsize4,
									hsize4+hsize41, hsize4+hsize41 );
					g.DrawLine( pen, x-hsize, y-hsize, x+hsize1, y+hsize1 );
					g.DrawLine( pen, x+hsize, y-hsize, x-hsize1, y+hsize1 );
					break;
				case SymbolType.Plus:
					g.FillRectangle( brush, x-hsize4, y-hsize4,
						hsize4+hsize41, hsize4+hsize41 );
					g.DrawLine( pen, x, y-hsize, x, y+hsize1 );
					g.DrawLine( pen, x-hsize, y, x+hsize1, y );
					break;
				case SymbolType.Star:
					g.FillRectangle( brush, x-hsize4, y-hsize4,
						hsize4+hsize41, hsize4+hsize41 );
					g.DrawLine( pen, x, y-hsize, x, y+hsize1 );
					g.DrawLine( pen, x-hsize, y, x+hsize1, y );
					g.DrawLine( pen, x-hsize, y-hsize, x+hsize1, y+hsize1 );
					g.DrawLine( pen, x+hsize, y-hsize, x-hsize1, y+hsize1 );
					break;
				case SymbolType.TriangleDown:
					polyPt[0].X = x;
					polyPt[0].Y = y+hsize;
					polyPt[1].X = x+hsize;
					polyPt[1].Y = y-hsize;
					polyPt[2].X = x-hsize;
					polyPt[2].Y = y-hsize;
					polyPt[3] = polyPt[0];
					g.FillPolygon( brush, polyPt );
					break;
			}
		}
	}
}

